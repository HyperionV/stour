import 'package:flutter/material.dart';
import 'package:stour/util/const.dart';
import 'package:stour/util/places.dart';
import 'package:stour/widgets/timeline_day.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class ScheduleScreen extends StatefulWidget {
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
  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List<List<Place>> res = [];

  void updateResultList(List<Place> newList, int idx) {
    setState(() {
      res[idx] = newList;
    });
  }

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
      if (places[i].closeTime <
              (widget.startTime.hour + widget.startTime.minute / 60) ||
          places[i].openTime >
              (widget.endTime.hour + widget.endTime.minute / 60) ||
          places[i].city != currentLocationDetail[1]) {
        continue;
      }
      Place tmpFood = food[i % food.length];
      tmpFood.id = const Uuid().v4();

      locations.add([places[i], tmpFood]);
    }
    return locations;
  }

  List<List<Place>> executeAlgo() {
    double budget = widget.maxBudget;
    int interval =
        widget.returnDate.difference(widget.departureDate).inDays + 1;
    double tMinus = (widget.endTime.hour + widget.endTime.minute / 60) -
        (widget.startTime.hour + widget.startTime.minute / 60);
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
    TextEditingController tourNameController = TextEditingController();
    if (res.isEmpty) {
      res = executeAlgo();
    }
    double totalMoney = 0;
    for (int i = 0; i < res.length; i++) {
      for (int j = 0; j < res[i].length; j++) {
        totalMoney += res[i][j].price;
      }
    }
    if (res.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Lịch Trình Dành Cho Bạn',
            style: TextStyle(
              color: Color.fromARGB(255, 35, 52, 10),
            ),
          ),
          backgroundColor: Constants.lightgreen,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color:
                    Color.fromARGB(255, 35, 52, 10)), // Change the color here
            onPressed: () {
              // Handle back button logic
              Navigator.pop(context);
            },
          ),
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
                      color: const Color.fromARGB(255, 35, 52, 10),
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 30),
                Text(
                    'Chúng tôi không thể đưa ra lịch trình phù hợp dựa trên những yêu cầu bạn đưa ra hoặc bạn đang ở địa điểm chưa được hỗ trợ bởi phần mềm!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      color: const Color.fromARGB(255, 35, 52, 10),
                      fontSize: 16,
                    )),
                const SizedBox(height: 20),
                Text(
                  'Xin hãy thử lại với những điều kiện khác!',
                  style: GoogleFonts.roboto(
                    color: const Color.fromARGB(255, 35, 52, 10),
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.lightgreen,
        title: const Text(
          'Lịch Trình Dành Cho Bạn',
          style: TextStyle(
            color: Color.fromARGB(255, 35, 52, 10),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 35, 52, 10)), // Change the color here
          onPressed: () {
            // Handle back button logic
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: double.maxFinite,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 3.0,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Tổng Quan',
                            style: GoogleFonts.roboto(
                                color: const Color.fromARGB(255, 35, 52, 10),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Số ngày: ${res.length}',
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: const Color.fromARGB(255, 35, 52, 10),
                            ),
                          ),
                          Text(
                            'Số tiền ước tính: ${totalMoney.toStringAsFixed(0)}₫',
                            style: GoogleFonts.roboto(
                              color: const Color.fromARGB(255, 35, 52, 10),
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text(
                                    'Nhập tên cho lịch trình này',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 35, 52, 10),
                                    ),
                                  ),
                                  content: TextField(
                                    controller: tourNameController,
                                    decoration: const InputDecoration(
                                        hintText: 'Tên lịch trình'),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text(
                                        'Hủy',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 35, 52, 10),
                                        ),
                                      ),
                                      onPressed: () {
                                        tourNameController.clear();
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text(
                                        'Lưu',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 35, 52, 10),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          savedTour.add(
                                            SavedTourClass(
                                              addedPlaces: res,
                                              name: tourNameController.text,
                                              timeSaved: DateTime.now(),
                                            ),
                                          );
                                          tourNameController.clear();
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text(
                            'Lưu lịch trình này',
                            style: TextStyle(
                              color: Color.fromARGB(255, 35, 52, 10),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: res.length,
              itemBuilder: (ctx, idx) {
                return Expanded(
                    child: TimelineDay(res[idx], idx + 1, updateResultList));
              },
            ),
          ),
        ],
      ),
    );
  }
}
