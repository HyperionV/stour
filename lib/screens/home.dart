import 'package:flutter/material.dart';
import 'package:stour/screens/trending.dart';
import 'package:stour/util/places.dart';
import 'package:stour/widgets/search_card.dart';
import 'package:stour/widgets/place_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: ListView(
            children: <Widget>[
              buildSearchBar(context),
              const SizedBox(height: 20.0),
              const SizedBox(height: 20.0),
              buildPlaceRow('Cultural Places', context),
              const SizedBox(height: 10.0),
              buildPlaceList(context),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }

  buildPlaceRow(String place, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          place,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        TextButton(
          child: Text(
            "See all (9)",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const Trending();
                },
              ),
            );
          },
        ),
      ],
    );
  }

  buildSearchBar(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 0), child: SearchCard());
  }

  buildPlaceList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.4,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        // itemCount: places == null ? 0 : places.length,
        itemCount: places.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = places[index];

          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: PlaceCard(
              //img: place["img"],
              title: place["title"],
              address: place["address"],
              rating: place["rating"],
              time: place["time"],
            ),
          );
        },
      ),
    );
  }
}