import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stour/widgets/place_detail.dart';
import 'package:stour/util/places.dart';

class GetPlaceById extends StatelessWidget {
  final String documentId;
  const GetPlaceById(this.documentId, {super.key});
  @override
  Widget build(BuildContext context) {
    CollectionReference place =
        FirebaseFirestore.instance.collection('stourplace1');

    return FutureBuilder<DocumentSnapshot>(
      future: place.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          Place pld = Place(
            id: data['id'],
            name: data['name'],
            address: data['address'],
            time: data['time'],
            img: data['img'],
            rating: data['rating'],
          );
          return PlaceDetailUI(pld);
        }

        return const Text("loading");
      },
    );
  }
}

class SearchByNameWidget extends StatelessWidget {
  final String searchQuery;
  const SearchByNameWidget(this.searchQuery, {super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('stourplace1')
          .where('name', isGreaterThanOrEqualTo: searchQuery)
          .where('name', isLessThan: '${searchQuery}z')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
          return const Text('No results found.');
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (BuildContext context, int index) {
            var document = snapshot.data!.docs[index];
            var name = document['name'];
            var image = document['img'];
            return ListTile(
              title: Text(name),
              leading: Image.network(image),
              subtitle: const Text('history'),
            );
          },
        );
      },
    );
  }
}
