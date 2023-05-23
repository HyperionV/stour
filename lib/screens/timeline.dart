import 'package:flutter/material.dart';
import 'package:stour/model/place.dart';
import 'package:stour/model/food.dart';

class Timeline extends StatelessWidget {
  const Timeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(

        // child: searchByNameWidget('Đại học'),
        child: filterByTopFood(),
        // child: getPlaceById('GJi2DqbSkJosKhq6SZf8'),
        );
  }
}
