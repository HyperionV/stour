import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:stour/screens/home.dart';
import 'package:stour/util/places.dart';
import 'package:flutter/services.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.placeToDisplay});
  final Place placeToDisplay;

  @override
  State<DetailScreen> createState() {
    return _DetailScreenState();
  }
}

class _DetailScreenState extends State<DetailScreen> {
  Color buttonColor = Colors.black;
  Icon initialFavIcon = const Icon(Icons.favorite_border, size: 30);
  @override
  Widget build(context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    // print('Print in Detail Screen ${placeToDisplay.img}');
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 25),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'Details',
                  style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 44, 105, 224),
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                IconButton(
                  onPressed: () {
                    return setState(
                      () {
                        buttonColor = Colors.red;
                        initialFavIcon = const Icon(Icons.favorite, size: 30);
                      },
                    );
                  },
                  // showDialog(
                  //     context: context,
                  //     builder: (ctx) {
                  //       return AlertDialog(
                  //         title: const Text('Feature Testing'),
                  //         content: const Text(
                  //             'If you can read this, the test was successful :D'),
                  //         actions: [
                  //           ElevatedButton(
                  //             onPressed: () {
                  //               Navigator.pop(ctx);
                  //             },
                  //             child: const Text('Noice'),
                  //           ),
                  //           ElevatedButton(
                  //             onPressed: () {
                  //               Navigator.pop(ctx);
                  //             },
                  //             child: const Text('Congrats'),
                  //           ),
                  //           ElevatedButton(
                  //             onPressed: () {
                  //               Navigator.pop(ctx);
                  //             },
                  //             child: const Text('Omedetou'),
                  //           ),
                  //         ],
                  //       );
                  //     });
                  icon: initialFavIcon,
                  color: buttonColor,
                ),
              ],
            ),
            const SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                widget.placeToDisplay.img,
                width: double.maxFinite,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                widget.placeToDisplay.title,
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_pin,
                    color: Color.fromARGB(255, 44, 105, 224),
                    size: 25,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        widget.placeToDisplay.address,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 44, 105, 224),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Congue nisi vitae suscipit tellus mauris a diam. Non curabitur gravida arcu ac tortor dignissim convallis aenean et. Euismod quis viverra nibh cras pulvinar. Viverra justo nec ultrices dui sapien eget. Congue mauris rhoncus aenean vel elit scelerisque mauris pellentesque pulvinar. Tristique magna sit amet purus gravida quis blandit turpis cursus. Egestas quis ipsum suspendisse ultrices gravida dictum. Egestas pretium aenean pharetra magna ac placerat vestibulum lectus. Nibh sed pulvinar proin gravida. Vel orci porta non pulvinar neque. Erat imperdiet sed euismod nisi porta. Commodo elit at imperdiet dui accumsan sit amet nulla facilisi. Tincidunt id aliquet risus feugiat in. Erat pellentesque adipiscing commodo elit at. Quam lacus suspendisse faucibus interdum. Quisque sagittis purus sit amet volutpat consequat. Suscipit adipiscing bibendum est ultricies integer quis.',
                    style: GoogleFonts.poppins(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
