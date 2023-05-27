import 'package:flutter/material.dart';

Row profileActivity() {
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
            subtitle: Center(
                child: Text(
              "Bài Đăng",
              style: TextStyle(fontSize: 13),
            )),
          ),
        ),
      ),
      Container(
        width: 130,
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
          subtitle: Center(
              child: Text(
            "Người Theo Dõi",
            style: TextStyle(fontSize: 13),
          )),
        ),
      ),
      const Expanded(
        child: ListTile(
          title: Center(
            child: Text(
              "4",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          subtitle: Center(
            child: Text(
              "Đang Theo Dõi",
              style: TextStyle(fontSize: 13),
            ),
          ),
        ),
      ),
    ],
  );
}
