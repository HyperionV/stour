// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:stour/util/places.dart';
import 'package:stour/screens/home.dart';
import 'package:stour/widgets/modify_timeline.dart';

class TimelineDay extends StatefulWidget {
  List<Place> placesToGo;
  final int dayNum;
  final void Function(List<Place>, int) updateResultList;
  TimelineDay(this.placesToGo, this.dayNum, this.updateResultList, {super.key});
  @override
  State<TimelineDay> createState() {
    return _TimelineDayState();
  }
}

class _TimelineDayState extends State<TimelineDay> {
  final TextEditingController tourNameController = TextEditingController();
  void _updatePlaceList(List<Place> newList) {
    setState(() {
      widget.placesToGo = newList;
    });
  }

  @override
  Widget build(context) {
    double totalCost = 0;
    for (int i = 0; i < widget.placesToGo.length; i++) {
      totalCost += widget.placesToGo[i].price;
    }
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Ngày thứ ${widget.dayNum} - ${totalCost.toStringAsFixed(0)}₫',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              TextButton(
                child: Text(
                  "Chỉnh sửa",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ModifyTimeline(
                          placeList: widget.placesToGo,
                          updatePlaceListFunc: _updatePlaceList,
                          updateResultList: widget.updateResultList,
                          idx: widget.dayNum - 1,
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 5),
          buildPlaceList(context, widget.placesToGo),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
