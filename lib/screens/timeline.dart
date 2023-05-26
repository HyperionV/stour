// @dart=2.17
import 'package:flutter/material.dart';
import 'package:stour/model/food.dart';

class Timeline extends StatelessWidget {
  const Timeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilterByTopFood(),
    );
  }
}
