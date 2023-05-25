import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stour/screens/timeline_screen.dart';
import 'package:intl/intl.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  DateTime _departureDate = DateTime.now();
  DateTime _returnDate = DateTime.now();
  double _maxBudget = 0;
  bool _isTravelingAlone = true;
  TimeOfDay _startTime = TimeOfDay(hour: 0, minute: 0);
  TimeOfDay _endTime = TimeOfDay(hour: 0, minute: 0);

  void _generateSchedule() {
    if (_departureDate == null ||
        _returnDate == null ||
        _maxBudget == null ||
        _startTime == null ||
        _endTime == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Missing Information'),
            content: Text('Please fill in all the required information.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
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
    super.initState();
    _departureDate = DateTime.now();
    _returnDate = DateTime.now();
    _maxBudget = 0;
    _startTime = TimeOfDay(hour: 0, minute: 0);
    _endTime = TimeOfDay(hour: 0, minute: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Preferences'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Departure Date',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
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
              icon: Icon(CupertinoIcons.calendar),
              label: Text(
                DateFormat('dd/MM/yyyy').format(_departureDate),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Return Date',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
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
              icon: Icon(CupertinoIcons.calendar),
              label: Text(
                DateFormat('dd/MM/yyyy').format(_returnDate),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Max Budget',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
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
              decoration: InputDecoration(
                hintText: 'Enter Max Budget',
                prefixIcon: Icon(CupertinoIcons.money_dollar),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Traveling Alone',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
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
                Text('Yes'),
                SizedBox(width: 16.0),
                Radio(
                  value: false,
                  groupValue: _isTravelingAlone,
                  onChanged: (value) {
                    setState(() {
                      _isTravelingAlone = value ?? false;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Start Time',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
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
              icon: Icon(CupertinoIcons.clock),
              label: Text(
                _startTime.format(context),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'End Time',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
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
              icon: Icon(CupertinoIcons.clock),
              label: Text(
                _endTime.format(context),
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _generateSchedule,
              child: Text('Generate Schedule'),
            ),
          ],
        ),
      ),
    );
  }
}
