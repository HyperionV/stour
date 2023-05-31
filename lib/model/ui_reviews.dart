import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stour/model/review.dart';
import 'package:stour/util/reviews.dart';
import 'package:stour/widgets/review_card.dart';

class GetUIAllReviewsByItemID extends StatelessWidget {
  final String locationID;
  GetUIAllReviewsByItemID({super.key, required this.locationID});
  final ReviewsServices rs = ReviewsServices();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DocumentSnapshot>>(
      future: rs.getAllReviewsByItemID(locationID),
      builder: (BuildContext context,
          AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('Không tìm thấy đánh giá.');
        }

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (BuildContext context, int index) {
            var document = snapshot.data![index];
            String id = document['id'];
            String user = document['user'];
            String userImg = document['user_img'];
            String name = document['name'];
            String idLocation = document['idLocation'];
            String content = document['content'];
            String score = document['score'];
            String createdAt = document['createdAt'];
            String updatedAt = document['updatedAt'];
            Reviews reviews = Reviews(
                id: id,
                user: user,
                userImg: userImg,
                name: name,
                idLocation: idLocation,
                content: content,
                score: score,
                createdAt: createdAt,
                updatedAt: updatedAt);
            return Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: ReviewWidget(review: reviews),
            );
          },
        );
      },
    );
  }
}
