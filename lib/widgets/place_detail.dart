import 'package:flutter/material.dart';
import 'package:stour/util/places.dart';

class PlaceDetail {
  final String id;
  final String name;
  final String address;
  final String rating;
  final int opentime;
  final int closetime;
  final String img;

  PlaceDetail({
    required this.id,
    required this.name,
    required this.address,
    required this.rating,
    required this.opentime,
    required this.closetime,
    required this.img,
  }) {}
}

class PlaceDetailUI extends StatelessWidget {
  final Place mplace;

  const PlaceDetailUI(this.mplace, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(mplace.img),
          Text(mplace.name),
          Text(mplace.address),
          Text('Quantity: ${mplace.time}'),
        ],
      ),
    );
  }
}
