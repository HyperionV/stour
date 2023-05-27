import 'package:flutter/material.dart';

class Reviewer {
  final String id;
  final String name;
  final List<Icon> rating;
  final String img;
  final String review;
  // final String history;

  const Reviewer(
      {required this.id,
      required this.name,
      required this.rating,
      required this.img,
      required this.review});
}
