import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    //Algorithm
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generated Schedule'),
      ),
      body: const Center(
        child: Text('Sinh schedule here'),
      ),
    );
  }
}
