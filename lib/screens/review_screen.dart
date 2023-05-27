import 'package:flutter/material.dart';
import 'package:stour/util/reviews.dart';
import 'package:stour/widgets/review_card.dart';
import 'package:stour/screens/create_review_screen.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});
  @override
  State<ReviewScreen> createState() => _ReviewScreenState<Reviews>();
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
        itemCount: user.length,
        itemBuilder: (context, index) {
          final review = user[index];
          return ReviewWidget(review: review);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newReview = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateReviewScreen(),
            ),
          );
          if (newReview != null) {
            setState(() {
              user.add(newReview);
            });
          }
        },
        tooltip: "Add Review",
        child: const Icon(Icons.add),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
