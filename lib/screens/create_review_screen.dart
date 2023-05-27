import 'package:flutter/material.dart';
// import 'package:stour/util/reviews.dart';
// import 'package:flutter/material.dart';
// import 'package:stour/util/reviews.dart';
import 'package:stour/model/review.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});
  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  int selectedStars = 5;
  TextEditingController commentController = TextEditingController();
  ReviewsServices rs = ReviewsServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('THÊM NHẬN XÉT'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Đánh giá địa điểm:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                buildStarButton(1),
                buildStarButton(2),
                buildStarButton(3),
                buildStarButton(4),
                buildStarButton(5),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Nhận xét:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: commentController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Nhập đánh giá ở đây.',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: const Text('HỦY'),
                ),
                ElevatedButton(
                  onPressed: () {
                    rs.createReview(
                        'review 2511111',
                        'abc',
                        'food1',
                        'Lê Ngọc Thảo',
                        'https://i.imgur.com/HASFzRW.jpg',
                        commentController.text,
                        selectedStars.toString());

                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('ĐĂNG BÀI'),
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
