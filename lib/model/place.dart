import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stour/widgets/place_detail.dart';

class getPlaceById extends StatelessWidget {
  final String documentId;
  getPlaceById(this.documentId);
  @override
  Widget build(BuildContext context) {
    CollectionReference place =
        FirebaseFirestore.instance.collection('stourplace1');

    return FutureBuilder<DocumentSnapshot>(
      future: place.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          PlaceDetail pld = PlaceDetail(
              data['image'], data['name'], data['history'], data['opentime']);
          return PlaceDetail_UI(pld);
        }

        return Text("loading");
      },
    );
  }
}

class searchByNameWidget extends StatelessWidget {
  final String searchQuery;
  searchByNameWidget(this.searchQuery);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('stourplace1')
          .where('name', isGreaterThanOrEqualTo: searchQuery)
          .where('name', isLessThan: searchQuery + 'z')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
          return Text('No results found.');
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (BuildContext context, int index) {
            var document = snapshot.data!.docs[index];
            var name = document['name'];
            var image = document['image'];
            var history = document['history'];

            return ListTile(
              title: Text(name),
              leading: Image.network(image),
              subtitle: Text(history),
            );
          },
        );
      },
    );
  }
}
