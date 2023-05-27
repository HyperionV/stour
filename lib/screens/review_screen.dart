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

class _ReviewScreenState<Reviews> extends State<ReviewScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
      body: FadeTransition(
        opacity: _animation,
        child: ListView.builder(
          itemCount: widget.reviews.length,
          itemBuilder: (context, index) {
            final review =
                widget.reviews[index]; // Cast the review to the correct type
            return ReviewWidget(review: review);
          },
        ),
      ),
      floatingActionButton: ScaleTransition(
        scale: _animation,
        child: FloatingActionButton(
          onPressed: () async {
            final newReview = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateReviewScreen(),
              ),
            );

            if (newReview != null) {
              setState(() {
                widget.reviews.add(newReview);
              });
            }
          },
          child: Icon(Icons.add),
          backgroundColor: Color(0xFFc3ff68),
          foregroundColor: Colors.black,
          tooltip: "Add Review",
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
