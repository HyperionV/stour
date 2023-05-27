import 'package:flutter/material.dart';
import 'package:stour/util/reviews.dart';
import 'dart:math';

// class ReviewWidget extends StatelessWidget {
//   final Reviews review;

//   const ReviewWidget({required this.review});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // CircleAvatar(
//             //   backgroundImage: NetworkImage(review.userImg),
//             //   radius: 25,
//             // ),
//             const SizedBox(width: 10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   review.name,
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w800,
//                   ),
//                   textAlign: TextAlign.left,
//                 ),
//                 Row(
//                   children: List.generate(int.parse(review.score), (index) {
//                     return Icon(Icons.star, color: Color(0xFFfff000));
//                   }),
//                 ),
//                 const SizedBox(height: 5),
//                 Wrap(
//                   children: [
//                     Text(
//                       review.content,
//                       softWrap: true,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ));
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:stour/util/reviews.dart';
// import 'dart:math';

class ReviewWidget extends StatelessWidget {
  final Reviews review;

  const ReviewWidget({required this.review});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(review.userImg),
            radius: 30,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(0xFFFFD700),
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      review.score,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: double.parse(review.score) / 5.0,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  review.content,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
