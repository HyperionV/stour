import 'package:flutter/material.dart';
import 'package:stour/util/places.dart';
import 'package:stour/screens/home.dart';

class TimelineDay extends StatelessWidget {
  final List<Place> placesToGo;
  final int dayNum;
  const TimelineDay(this.placesToGo, this.dayNum, {super.key});
  @override
  Widget build(context) {
    double totalCost = 0;
    for (int i = 0; i < placesToGo.length; i++) {
      totalCost += placesToGo[i].price;
    }
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 10),
          buildPlaceRow('Ngày thứ $dayNum - ${totalCost.toStringAsFixed(0)}₫',
              placesToGo, context),
          const SizedBox(height: 5),
          buildPlaceList(context, placesToGo),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
