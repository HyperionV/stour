import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:stour/screens/timeline_screen.dart';
import 'package:intl/intl.dart';
import 'package:stour/util/const.dart';
import 'package:google_fonts/google_fonts.dart';

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
        backgroundColor: Constants.lightgreen,
        title: Text(
          'THIẾT KẾ LỊCH TRÌNH',
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 35, 52, 10)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Ngày Khởi Hành',
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 35, 52, 10)),
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
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Constants.darkgreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        icon: const Icon(
                          CupertinoIcons.calendar,
                          color: Color(0xFFfff000),
                        ),
                        label: Text(
                          DateFormat('dd/MM/yyyy').format(_departureDate),
                          style: GoogleFonts.roboto(
                              // color: Constants.text,
                              ),
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(width: 30),
                  const Spacer(),
                  Column(
                    children: [
                      Text('Ngày Trở Lại',
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 35, 52, 10))),
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
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Constants.darkgreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        icon: const Icon(
                          CupertinoIcons.calendar,
                          color: Color(0xFFfff000),
                        ),
                        label: Text(
                          DateFormat('dd/MM/yyyy').format(_returnDate),
                          style: GoogleFonts.roboto(
                              // color: Constants.text,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Text(
                'Ngân Sách (VND)',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 35, 52, 10)),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                textAlignVertical: TextAlignVertical.bottom,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (value) {
                  setState(
                    () {
                      _maxBudget = double.tryParse(value) ?? 0;
                    },
                  );
                },
                decoration: const InputDecoration(
                  hintText: 'Nhập ngân sách tối đa',
                  prefixIcon: Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Color(0xFFfff000),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Bạn sẽ đi du lịch một mình?',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 35, 52, 10)),
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
                  Text('Có',
                      style: GoogleFonts.roboto(
                          color: const Color.fromARGB(255, 35, 52, 10))),
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
                  Text('Không',
                      style: GoogleFonts.roboto(
                          color: const Color.fromARGB(255, 35, 52, 10))),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Giờ Bắt Đầu',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 35, 52, 10),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      ElevatedButton.icon(
                        onPressed: () async {
                          final TimeOfDay? picked = await showTimePicker(
                            context: context,
                            initialTime: _startTime,
                          );
                          if (picked != null) {
                            setState(
                              () {
                                _startTime = picked;
                              },
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Constants.darkgreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        icon: const Icon(
                          CupertinoIcons.clock,
                          color: Color(0xFFfff000),
                        ),
                        label: Text(
                          _startTime.format(context),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        'Giờ Về',
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 35, 52, 10)),
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
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Constants.darkgreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        icon: const Icon(
                          CupertinoIcons.clock,
                          color: Color(0xFFfff000),
                        ),
                        label: Text(
                          _endTime.format(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              Center(
                child: ElevatedButton(
                  onPressed: _generateSchedule,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Constants.ratingBG,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    minimumSize: const Size(150, 50),
                  ),
                  child: Text(
                    'Xây dựng Lịch Trình',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 35, 52, 10)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
