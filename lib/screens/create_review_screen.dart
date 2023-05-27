import 'package:flutter/material.dart';
import 'package:stour/util/reviews.dart';
import 'package:stour/screens/review_screen.dart';
import 'package:flutter/material.dart';
import 'package:stour/util/reviews.dart';

class CreateReviewScreen extends StatefulWidget {
  @override
  _CreateReviewScreenState createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  int selectedStars = 5;
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Review'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rate the Place:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                buildStarButton(1),
                buildStarButton(2),
                buildStarButton(3),
                buildStarButton(4),
                buildStarButton(5),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Comments:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: commentController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Enter your comments',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Discard the review and navigate back to the previous screen
                    Navigator.pop(context);
                  },
                  child: Text('Discard'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Post the review and navigate back to the previous screen
                    Reviews newReview = Reviews(
                      id: '', // Assign a unique ID
                      user: '', // Assign the user name
                      userImg: '', // Assign the user image URL
                      name: '', // Assign the place name
                      idLocation: '', // Assign the location ID
                      content: commentController.text,
                      score: selectedStars.toString(),
                      createdAt: '', // Assign the current timestamp
                      updatedAt: '', // Assign the current timestamp
                    );
                    Navigator.pop(context, newReview);
                  },
                  child: Text('Post Review'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStarButton(int stars) {
    return IconButton(
      onPressed: () {
        setState(() {
          selectedStars = stars;
        });
      },
      icon: Icon(
        stars <= selectedStars ? Icons.star : Icons.star_border,
        size: 30,
        color: Colors.amber,
      ),
    );
  }
}
