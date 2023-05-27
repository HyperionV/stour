import 'package:flutter/material.dart';
import 'package:stour/util/places.dart';
import 'package:stour/widgets/timeline_day.dart';
import 'package:google_fonts/google_fonts.dart';

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
    for (int i = 0; i < places.length; i++) {
      if (places[i].closeTime < (startTime.hour + startTime.minute / 60) ||
          places[i].openTime > (endTime.hour + endTime.minute / 60) ||
          places[i].city != currentLocationDetail[1]) {
        continue;
      }
      locations.add([places[i], food[i % food.length]]);
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
    if (res.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Lịch Trình Dành Cho Bạn'),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Rất Tiếc!',
                style: GoogleFonts.roboto(
                    fontSize: 30, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 30),
              Text(
                  'Chúng tôi không thể đưa ra lịch trình phù hợp dựa trên những yêu cầu bạn đưa ra hoặc bạn đang ở địa điểm chưa được hỗ trợ bởi phần mềm!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                  )),
              const SizedBox(height: 20),
              Text(
                'Xin hãy thử lại với những điều kiện khác!',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                ),
              )
            ],
          ),
        )),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lịch Trình Dành Cho Bạn'),
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
