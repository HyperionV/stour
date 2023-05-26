import 'package:flutter/material.dart';
import 'package:stour/util/places.dart';

class TimelineDay extends StatelessWidget {
  final List<Place> placesToGo;
  final int dayNum;
  const TimelineDay(this.placesToGo, this.dayNum, {super.key});
  @override
  Widget build(context) {
    return Column(
      children: [
        Text('Day $dayNum:'),
        const SizedBox(
          height: 20,
        ),
        Column(
            children: placesToGo.map((data) {
          return TimelineItem(data);
        }).toList()),
      ],
    );
  }
}

class TimelineItem extends StatelessWidget {
  final Place placeToGo;
  const TimelineItem(this.placeToGo, {super.key});
  @override
  Widget build(context) {
    return Text(placeToGo.name);
  }
}
