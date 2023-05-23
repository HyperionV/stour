import 'package:flutter/material.dart';
import 'package:stour/util/places.dart';
import 'package:stour/widgets/search_card.dart';
import 'package:stour/widgets/trending_place.dart';

class Trending extends StatelessWidget {
  const Trending({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Top picks for you"),
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
              // itemCount: places == null ? 0 : places.length,
              itemCount: places.length,
              itemBuilder: (BuildContext context, int index) {
                return TrendingPlace(place: places[index]);
              },
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
