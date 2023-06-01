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

  void createReview(String id, String user, String idLocation, String name,
      String userImg, String content, String score) {
    CollectionReference reviewsRef =
        FirebaseFirestore.instance.collection('reviews');
    reviewsRef
        .add({
          'id': id,
          'name': name,
          'user': user,
          'user_img': userImg,
          'content': content,
          'idLocation': idLocation,
          'score': score,
          'createdAt': DateTime.now().toUtc().toString(),
          'updatedAt': DateTime.now().toUtc().toString(),
        })
        .then((value) {})
        .catchError((error) {});
  }

  // void reloadReviews(String locationID) async {
  //   ReviewsServices rs = ReviewsServices();
  //   QuerySnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('reviews')
  //       .where('idLocation', isEqualTo: locationID)
  //       .get();
  // }
}
