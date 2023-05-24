import 'package:flutter/material.dart';
import 'package:stour/screens/home.dart';
import 'package:stour/screens/timeline.dart';
import 'package:stour/screens/profile.dart';
// import 'package:stour/model/place.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stour/util/places.dart';

import 'notifications.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController = PageController();
  int _page = 0;

  List icons = [
    Icons.home,
    Icons.table_chart,
    Icons.notifications,
    Icons.person,
  ];

  List<Widget> pages = [
    const Home(),
    const Timeline(),
    const Notifications(),
    const Profile(),
  ];

  void getPlaceById(String documentId) {
    CollectionReference place =
        FirebaseFirestore.instance.collection('stourplace1');
    place.doc(documentId).get().then((DocumentSnapshot snapshot) {
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        placesTmp.add(
          Place(
            id: data['id'],
            name: data['name'],
            address: data['address'],
            time: data['time'],
            rating: data['rating'],
            img: data['image'],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getPlaceById('GJi2DqbSkJosKhq6SZf8');
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: List.generate(4, (index) => pages[index]),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // SizedBox(width: 7),
            buildTabIcon(0),
            buildTabIcon(1),
            buildTabIcon(2),
            buildTabIcon(3),
            // SizedBox(width: 7),
          ],
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  Widget buildTabIcon(int index) {
    return Container(
      margin:
          EdgeInsets.fromLTRB(index == 3 ? 30 : 0, 0, index == 1 ? 30 : 0, 0),
      child: IconButton(
        icon: Icon(
          icons[index],
          size: 24.0,
        ),
        color: _page == index
            ? Theme.of(context).colorScheme.secondary
            : Colors.blue,
        onPressed: () => _pageController.jumpToPage(index),
      ),
    );
  }
}
