import 'package:flutter/material.dart';
import 'package:stour/util/places.dart';
import 'package:intl/intl.dart';
import 'package:stour/screens/view_saved_tour.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stour/util/const.dart';

class SavedTour extends StatefulWidget {
  const SavedTour({super.key});
  @override
  State<SavedTour> createState() {
    return _SavedTourState();
  }
}

class _SavedTourState extends State<SavedTour> {
  final TextEditingController _tourNameController = TextEditingController();

  void _showRenameDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Đổi tên'),
          content: TextField(
            controller: _tourNameController,
            decoration: const InputDecoration(hintText: 'Tên mới'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Hủy',
                style: TextStyle(
                  color: Color.fromARGB(255, 35, 52, 10),
                ),
              ),
              onPressed: () {
                _tourNameController.clear();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Lưu',
                  style: TextStyle(
                    color: Color.fromARGB(255, 35, 52, 10),
                  )),
              onPressed: () {
                setState(
                  () {
                    savedTour[index].name = _tourNameController.text;
                    _tourNameController.clear();
                  },
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showContextMenu(BuildContext context, int index) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext ctx) {
          return Column(
            children: [
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text(
                  'Đổi tên',
                  style: TextStyle(
                    color: Color.fromARGB(255, 35, 52, 10),
                  ),
                ),
                onTap: () {
                  Navigator.of(ctx).pop();
                  _showRenameDialog(context, index);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text(
                  'Xóa lịch trình',
                  style: TextStyle(
                    color: Color.fromARGB(255, 35, 52, 10),
                  ),
                ),
                onTap: () {
                  Navigator.of(ctx).pop();
                  setState(() {
                    savedTour.removeAt(index);
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(context) {
    if (savedTour.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'LỊCH TRÌNH ĐÃ LƯU',
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
                  'Thật trống trải...',
                  style: GoogleFonts.roboto(
                      fontSize: 30, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 30),
                Text('Có vẻ như bạn chưa tạo cho mình một lịch trình nào',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      color: const Color.fromARGB(255, 35, 52, 10),
                      fontSize: 16,
                    )),
                const SizedBox(height: 20),
                Text(
                  'Hãy tạo cho mình một lịch trình bằng chức năng thiết kế lịch trình ngay nhé!',
                  textAlign: TextAlign.center,
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
        title: const Text(
          'LỊCH TRÌNH ĐÃ LƯU',
          style: TextStyle(
            color: Color.fromARGB(255, 35, 52, 10),
          ),
        ),
        backgroundColor: Constants.lightgreen,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 35, 52, 10)), // Change the color here
          onPressed: () {
            // Handle back button logic
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: savedTour.length,
        itemBuilder: (BuildContext context, int index) {
          SavedTourClass tour = savedTour[index];
          return ListTile(
            title: Text(tour.name,
                style: const TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text(
                'Được tạo vào: ${DateFormat.yMd().format(tour.timeSaved)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ViewSavedTour(
                      savedTour: savedTour[index],
                    );
                  },
                ),
              );
            },
            onLongPress: () {
              _showContextMenu(context, index);
            },
          );
        },
      ),
    );
  }
}
