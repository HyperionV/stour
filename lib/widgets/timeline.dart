import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stour/screens/timeline_screen.dart';
import 'package:intl/intl.dart';

class Timeline extends StatefulWidget {
  const Timeline({super.key});
  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  DateTime _departureDate = DateTime.now();
  DateTime _returnDate = DateTime.now();
  double _maxBudget = 0;
  bool _isTravelingAlone = true;
  TimeOfDay _startTime = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay _endTime = const TimeOfDay(hour: 0, minute: 0);

  void _generateSchedule() {
    {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScheduleScreen(
            departureDate: _departureDate,
            returnDate: _returnDate,
            maxBudget: _maxBudget,
            isTravelingAlone: _isTravelingAlone,
            startTime: _startTime,
            endTime: _endTime,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    _departureDate = DateTime.now();
    _returnDate = DateTime.now();
    _maxBudget = 0;
    _startTime = const TimeOfDay(hour: 0, minute: 0);
    _endTime = const TimeOfDay(hour: 0, minute: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Preferences'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Departure Date',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton.icon(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _departureDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() {
                      _departureDate = picked;
                    });
                  }
                },
                icon: const Icon(CupertinoIcons.calendar),
                label: Text(
                  DateFormat('dd/MM/yyyy').format(_departureDate),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Return Date',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton.icon(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _returnDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() {
                      _returnDate = picked;
                    });
                  }
                },
                icon: const Icon(CupertinoIcons.calendar),
                label: Text(
                  DateFormat('dd/MM/yyyy').format(_returnDate),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Max Budget',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (value) {
                  setState(() {
                    _maxBudget = double.tryParse(value) ?? 0;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Enter Max Budget',
                  prefixIcon: Icon(CupertinoIcons.money_dollar),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Traveling Alone',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Radio(
                    value: true,
                    groupValue: _isTravelingAlone,
                    onChanged: (value) {
                      setState(() {
                        _isTravelingAlone = value ?? false;
                      });
                    },
                  ),
                  const Text('Yes'),
                  const SizedBox(width: 16.0),
                  Radio(
                    value: false,
                    groupValue: _isTravelingAlone,
                    onChanged: (value) {
                      setState(() {
                        _isTravelingAlone = value ?? false;
                      });
                    },
                  ),
                  const Text('No'),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Start Time',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton.icon(
                onPressed: () async {
                  final TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: _startTime,
                  );
                  if (picked != null) {
                    setState(() {
                      _startTime = picked;
                    });
                  }
                },
                icon: const Icon(CupertinoIcons.clock),
                label: Text(
                  _startTime.format(context),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'End Time',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton.icon(
                onPressed: () async {
                  final TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: _endTime,
                  );
                  if (picked != null) {
                    setState(() {
                      _endTime = picked;
                    });
                  }
                },
                icon: const Icon(CupertinoIcons.clock),
                label: Text(
                  _endTime.format(context),
                ),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _generateSchedule,
                child: const Text('Generate Schedule'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
