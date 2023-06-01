import 'package:flutter/material.dart';
import 'package:stour/model/review.dart';
import 'package:stour/util/const.dart';
import 'package:stour/util/reviews.dart';
// import 'package:stour/widgets/review_card.dart';
import 'package:stour/screens/create_review_screen.dart';
import 'package:stour/model/ui_reviews.dart';

class ReviewScreen extends StatefulWidget {
  final String locationID;
  const ReviewScreen({super.key, required this.locationID});
  @override
  State<ReviewScreen> createState() => _ReviewScreenState<Reviews>();
}

class _ReviewScreenState<Reviews> extends State<ReviewScreen> {
  ReviewsServices rs = ReviewsServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ĐÁNH GIÁ',
          style: TextStyle(
            color: Color.fromARGB(255, 35, 52, 10),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 35, 52, 10)), // Change the color here
          onPressed: () {
            // Handle back button logic
            Navigator.pop(context);
          },
        ),
        backgroundColor: Constants.lightgreen,
      ),
      body:
          Center(child: GetUIAllReviewsByItemID(locationID: widget.locationID)),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newReview = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CreateReviewScreen(locationID: widget.locationID),
            ),
          );
          if (newReview != null) {
            setState(() {
              user.add(newReview);
            });
          }
        },
        backgroundColor: Constants.lightgreen,
        tooltip: "THÊM ĐÁNH GIÁ",
        child: const Icon(Icons.add, color: Colors.black),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
