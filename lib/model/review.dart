import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewsServices {
  Future<List<DocumentSnapshot>> getAllReviewsByItemID(
      String locationID) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('reviews')
        .where('idLocation', isEqualTo: locationID)
        .get();

    return snapshot.docs;
  }
}
