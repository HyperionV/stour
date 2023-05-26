import 'package:flutter/material.dart';
import 'package:stour/util/places.dart';
import 'package:stour/widgets/timeline_day.dart';

class ScheduleScreen extends StatelessWidget {
  final DateTime departureDate;
  final DateTime returnDate;
  final double maxBudget;
  final bool isTravelingAlone;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  const ScheduleScreen(
      {required this.departureDate,
      required this.returnDate,
      required this.maxBudget,
      required this.isTravelingAlone,
      required this.startTime,
      required this.endTime,
      super.key});

  int _isValid(double budget, double tmpTime, Place src) {
    bool cond1 = src.price > budget;
    bool cond2 = src.duration > tmpTime;
    if (cond1) return 0;
    if (!cond1 && cond2) return 1;
    return 2;
  }

  List<List<Place>> getData() {
    List<List<Place>> locations = [];
    for (int i = 0; i < places.length - 1; i++) {
      locations.add([places[i], food[i]]);
    }
    return locations;
  }

  List<List<Place>> executeAlgo() {
    double budget = maxBudget;
    int interval = returnDate.difference(departureDate).inDays + 1;
    double tMinus = (endTime.hour + endTime.minute / 60) -
        (startTime.hour + startTime.minute / 60);
    List<List<Place>> placesList = getData();
    List<List<Place>> res = [];
    double tmpTime = tMinus;
    while (interval-- > 0 && placesList.isNotEmpty) {
      List<Place> tmpList = [];
      placesList = placesList.where((placePair) {
        int firstRes = _isValid(budget, tmpTime, placePair[0]);
        if (firstRes == 0) {
          return false;
        } else if (firstRes == 1) {
          return true;
        } else {
          tmpList.add(placePair[0]);
          budget -= placePair[0].price;
          tmpTime -= placePair[0].duration;
          if (_isValid(budget, tmpTime, placePair[1]) == 2) {
            tmpList.add(placePair[1]);
            budget -= placePair[1].price;
            tmpTime -= placePair[1].duration;
          }
          return false;
        }
      }).toList();
      tmpTime = tMinus;
      res.add(tmpList);
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    List<List<Place>> res = executeAlgo();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generated Schedule'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: res.length,
          itemBuilder: (ctx, idx) {
            return Expanded(child: TimelineDay(res[idx], idx + 1));
          },
        ),
      ),
    );
  }
}
