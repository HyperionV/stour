import 'package:flutter/material.dart';
import 'package:stour/screens/trending.dart';
import 'package:stour/util/const.dart';
import 'package:stour/util/places.dart';
import 'package:stour/widgets/search_card.dart';
import 'package:stour/widgets/place_card.dart';
import 'package:stour/model/place.dart';
import 'package:stour/screens/home_app_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
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
        backgroundColor: Constants.lightPrimary,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: HomeAppBar(),
        ),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              //buildSearchBar(context),
              // const SizedBox(height: 10.0),
              // const SizedBox(height: 10.0),
              buildPlaceRow('Cultural Places', places, context),
              const SizedBox(height: 3.0),
              buildPlaceList(context, places),
              const SizedBox(height: 5.0),
              buildPlaceRow('Unique Cuisines', food, context),
              const SizedBox(height: 3.0),
              buildPlaceList(context, food),
            ],
          ),
        ),
        //bottomNavigationBar: HomeBottomBar(),
      ),
    );
    //   ),
    // );
    //     ),
    //   ),
    // );
  }

  Widget buildPlaceRow(String place, List<Place> source, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: 20.0), // Adjust the horizontal padding as needed
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              place,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 75, 50),
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        TextButton(
          child: Text(
            "See all (${source.length})",
            style: TextStyle(
              color: Constants.darkPrimary,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return Trending(source: places);
                },
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    getPlaceById('GJi2DqbSkJosKhq6SZf8');
    super.initState();
  }

  Widget buildPlaceList(BuildContext context, List<Place> source) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.4,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        // itemCount: places == null ? 0 : places.length,
        itemCount: source.length,
        itemBuilder: (BuildContext context, int index) {
          Place place = source[index];
          return Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10.0),
            child: PlaceCard(place: place),
          );
        },
      ),
    );
  }
}
