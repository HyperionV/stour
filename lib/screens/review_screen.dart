import 'package:flutter/material.dart';
import 'package:stour/util/reviews.dart';
import 'package:stour/widgets/review_card.dart';
import 'package:stour/screens/create_review_screen.dart';

class ReviewScreen extends StatefulWidget {
  final List<Reviews> reviews;
  const ReviewScreen({required this.reviews});
  @override
  _ReviewScreenState createState() => _ReviewScreenState<Reviews>();
}

class _ReviewScreenState<Reviews> extends State<ReviewScreen> {
  // Access the reviews list using widget.reviews
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ĐÁNH GIÁ',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.reviews.length,
        itemBuilder: (context, index) {
          final review = widget.reviews[index];
          return ReviewWidget(review: review);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to the CreateReviewScreen and wait for the result
          final newReview = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateReviewScreen(),
            ),
          );

          // Check if a review was returned from CreateReviewScreen
          if (newReview != null) {
            setState(() {
              // Add the new review to the list of reviews
              widget.reviews.add(newReview);
            });
          }
        },
        child: Icon(Icons.add),
        tooltip: "Add Review",
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
