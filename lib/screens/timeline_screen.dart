import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  final DateTime departureDate;
  final DateTime returnDate;
  final double maxBudget;
  final bool isTravelingAlone;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  ScheduleScreen({
    required this.departureDate,
    required this.returnDate,
    required this.maxBudget,
    required this.isTravelingAlone,
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    //Algorithm
    return Scaffold(
      appBar: AppBar(
        title: Text('Generated Schedule'),
      ),
      body: Center(
        child: Text('Sinh schedule here'),
      ),
    );
  }
}
