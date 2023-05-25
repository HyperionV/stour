import 'package:flutter/material.dart';
import 'package:stour/util/const.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<int> _images = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _images.map((e) {
        return buildPost(context);
      }).toList(),
    );
  }

  Container buildPost(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Card(
        margin: EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                            "https://i.pinimg.com/236x/0a/b5/9e/0ab59e7c8e7a1213ff1ee891e98e06ae.jpg?nii=t"),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hato",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "2 months ago",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return [
                        const PopupMenuItem(
                          value: "delete",
                          child: Text("Delete Post"),
                        ),
                        const PopupMenuItem(
                          value: "save",
                          child: Text("Save Post"),
                        ),
                      ];
                    },
                    child: Icon(
                      Icons.more_vert,
                      color: Constants.darkPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: const Text(
                "Toi met moi",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: 250,
              child: Card(
                elevation: 0,
                semanticContainer: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  "https://i.pinimg.com/236x/0a/b5/9e/0ab59e7c8e7a1213ff1ee891e98e06ae.jpg?nii=t",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(Icons.favorite_outline,
                            color: Constants.darkPrimary),
                        const SizedBox(width: 5),
                        Text("123"),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(Icons.comment_outlined,
                            color: Constants.darkPrimary),
                        const SizedBox(width: 5),
                        Text("123"),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(Icons.share_outlined,
                            color: Constants.darkPrimary),
                        const SizedBox(width: 5),
                        Text("1"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
