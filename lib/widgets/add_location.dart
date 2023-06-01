import 'package:flutter/material.dart';
import 'package:stour/util/places.dart';
import 'package:stour/util/const.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class AddLocation extends StatefulWidget {
  List<Place> newList = [];
  final void Function(List<Place>) updateNewList;
  final void Function(List<Place>) updateOriginalList;
  final void Function(List<Place>, int) updateResultList;
  final int idx;
  AddLocation(
      {required this.newList,
      required this.updateNewList,
      required this.updateOriginalList,
      required this.idx,
      required this.updateResultList,
      super.key});

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'THÊM ĐỊA ĐIỂM',
          style: GoogleFonts.roboto(
            color: const Color.fromARGB(255, 35, 52, 10),
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
        backgroundColor: Constants.lightgreen,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 75,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  'Thêm hoặc bỏ địa điểm ra khỏi lịch trình bằng danh sách bên dưới: ',
                  style: GoogleFonts.roboto(fontSize: 18),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(places[index].name),
                  value: widget.newList.contains(places[index]),
                  onChanged: (value) {
                    setState(() {
                      if (value!) {
                        if (!widget.newList.contains(places[index])) {
                          widget.newList.add(places[index]);
                          widget.updateNewList(widget.newList);
                          widget.updateOriginalList(widget.newList);
                          widget.updateResultList(widget.newList, widget.idx);
                        }
                      } else {
                        widget.newList.remove(places[index]);
                        widget.updateNewList(widget.newList);
                        widget.updateOriginalList(widget.newList);
                        widget.updateResultList(widget.newList, widget.idx);
                      }
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
