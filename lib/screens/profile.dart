import 'package:stour/util/const.dart';
import 'package:stour/widgets/profile_img.dart';
import 'package:stour/widgets/profile_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:stour/screens/profile_post.dart';
import 'package:stour/screens/saved_tour.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final int _selectedEvent = 0;

  final List<Widget> _pages = [const PostScreen()]; //GalleryScreen()

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                profileImage(size),
                profileInfo(),
                profileActivity(),
                profileEvents(size),
                _pages[_selectedEvent],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container profileEvents(Size size) {
    return Container(
      margin: EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: size.width / 3.6,
              padding: const EdgeInsets.all(8),
              child: MaterialButton(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    side: BorderSide(color: Constants.darkPrimary)),
                color:
                    _selectedEvent == 1 ? Constants.lightPrimary : Colors.white,
                onPressed: () {},
                child: Text(
                  "THÊM BÀI VIẾT",
                  style: GoogleFonts.roboto(
                    color: _selectedEvent == 1
                        ? Constants.lightPrimary
                        : const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: size.width / 3.6,
              padding: const EdgeInsets.all(8),
              child: MaterialButton(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    side: BorderSide(color: Constants.darkPrimary)),
                color:
                    _selectedEvent == 1 ? Constants.lightPrimary : Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SavedTour();
                      },
                    ),
                  );
                },
                child: Text(
                  "LỊCH TRÌNH ĐÃ LƯU",
                  style: GoogleFonts.roboto(
                    color: _selectedEvent == 1
                        ? Constants.lightPrimary
                        : const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Container profileInfo() {
  return Container(
    padding: EdgeInsets.zero,
    child: ListTile(
      title: Row(
        children: [
          Text(
            "Hato",
            style: GoogleFonts.roboto(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      subtitle: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(
                  Icons.home,
                  color: Constants.darkPrimary,
                ),
                Text(
                  "Can Tho",
                  style: GoogleFonts.roboto(fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: Constants.darkPrimary,
                ),
                Text(
                  "Bio",
                  style: GoogleFonts.roboto(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
