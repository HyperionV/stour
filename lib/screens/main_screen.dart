import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:stour/screens/home.dart';
import 'package:stour/widgets/timeline.dart';
import 'package:stour/screens/profile.dart';
import 'package:stour/util/const.dart';

List icons = [
  Icons.timeline,
  Icons.home,
  Icons.person,
];

List<Widget> pages = [
  const Timeline(),
  const Home(),
  const Profile(),
];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController = PageController();
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: HomeBottomBar(
        onTap: navigationTapped,
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: onPageChanged,
              children: List.generate(3, (index) => pages[index]),
            ),
          ),
          //buildTabIcon(),
        ],
      ),
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
}

class HomeBottomBar extends StatelessWidget {
  final Function(int) onTap;
  const HomeBottomBar({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Constants.darkgreen,
      index: 2,
      items: [
        Icon(icons[0], size: 30, color: Constants.lightgreen),
        Icon(icons[1], size: 30, color: Constants.lightgreen),
        Icon(icons[2], size: 30, color: Constants.lightgreen),
      ],
      onTap: onTap,
    );
  }
}
