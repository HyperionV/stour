import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TopFoodService {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('food');

  Future<List<DocumentSnapshot>> getTopFoods(int limit) async {
    QuerySnapshot querySnapshot =
        await collection.orderBy('rating', descending: true).limit(limit).get();

    return querySnapshot.docs;
  }
}

class FilterByTopFood extends StatelessWidget {
  FilterByTopFood({super.key});
  final TopFoodService topFoodService = TopFoodService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DocumentSnapshot>>(
      future: topFoodService.getTopFoods(10),
      builder: (BuildContext context,
          AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No top foods found.');
        }

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (BuildContext context, int index) {
            var document = snapshot.data![index];
            var name = document['name'];
            var image = document['image'];
            var rating = document['rating'];

            return ListTile(
              title: Text(name),
              leading: Image.network(image),
              subtitle: Text("Rating: ${rating.toString()}"),
            );
          },
        );
      },
    );
  }
}
