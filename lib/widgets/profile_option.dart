import 'package:flutter/material.dart';

Row ProfileActivity() {
  return Row(
    children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          child: const ListTile(
            title: Center(
              child: Text(
                "3",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle: Center(child: Text("Posts")),
          ),
        ),
      ),
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          child: const ListTile(
            title: Center(
              child: Text(
                "12",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle: Center(child: Text("Followers")),
          ),
        ),
      ),
      Expanded(
        child: const ListTile(
          title: Center(
            child: Text(
              "4",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          subtitle: Center(child: Text("Following")),
        ),
      ),
    ],
  );
}
