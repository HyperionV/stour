import 'package:flutter/material.dart';
import 'package:stour/util/places.dart';
import 'package:stour/widgets/search_card.dart';
import 'package:stour/widgets/trending_place.dart';

class Trending extends StatelessWidget {
  final List<Place> source;
  const Trending({super.key, required this.source});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xFFc3ff68),
        title: const Text(
          "Địa Điểm Văn Hóa",
          style: TextStyle(
            color: Color.fromARGB(255, 35, 52, 10),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10.0,
        ),
        child: ListView(
          children: <Widget>[
            SearchCard(),
            const SizedBox(height: 10.0),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: source.length,
              itemBuilder: (BuildContext context, int index) {
                return TrendingPlace(place: source[index]);
              },
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
