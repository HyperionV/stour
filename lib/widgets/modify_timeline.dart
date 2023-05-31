// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:stour/util/places.dart';
import 'package:stour/widgets/add_location.dart';
import 'package:stour/util/const.dart';

class ModifyTimeline extends StatefulWidget {
  List<Place> placeList;
  final void Function(List<Place>) updatePlaceListFunc;
  final void Function(List<Place>, int) updateResultList;
  final int idx;
  ModifyTimeline(
      {super.key,
      required this.placeList,
      required this.updatePlaceListFunc,
      required this.idx,
      required this.updateResultList});
  @override
  State<ModifyTimeline> createState() {
    return _ModifyTimelineState();
  }
}

class _ModifyTimelineState extends State<ModifyTimeline> {
  void updateNewList(List<Place> newList) {
    setState(() {
      widget.placeList = newList;
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CHỈNH SỬA LỊCH TRÌNH',
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
        backgroundColor: Constants.lightgreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AddLocation(
                        newList: widget.placeList,
                        updateNewList: updateNewList,
                        updateOriginalList: widget.updatePlaceListFunc,
                        idx: widget.idx,
                        updateResultList: widget.updateResultList,
                      );
                    },
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Constants.darkgreen),
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                child: ListTile(
                  title: Text('Thêm Hoặc Bỏ Chọn Địa Điểm',
                      style: TextStyle(color: Constants.text)),
                  leading: const Icon(Icons.add_circle_outline_outlined),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 650,
              child: ReorderableListView.builder(
                itemCount: widget.placeList.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = widget.placeList[index];
                  return Container(
                    key: ValueKey(item.id),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ListTile(
                      title: Text(item.name),
                      leading: const Icon(Icons.drag_handle),
                    ),
                  );
                },
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) {
                      newIndex -= 1;
                    }
                    final Place item = widget.placeList.removeAt(oldIndex);
                    widget.placeList.insert(newIndex, item);
                    widget.updatePlaceListFunc(widget.placeList);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
