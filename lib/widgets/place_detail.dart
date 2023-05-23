import 'package:flutter/material.dart';

class PlaceDetail {
  final String name;
  // final String address;
  final String opentime;
  // final String closetime;
  // final String avgcost;
  final String history;
  // final String city;
  // final String district;
  final String image;

  PlaceDetail(this.image, this.name, this.history, this.opentime);
}

class PlaceDetail_UI extends StatelessWidget {
  final PlaceDetail mplace;

  PlaceDetail_UI(this.mplace);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(mplace.image),
          Text(mplace.name),
          Text(mplace.history),
          Text('Quantity: ${mplace.opentime}'),
        ],
      ),
    );
  }
}
