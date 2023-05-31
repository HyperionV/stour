import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          child: ListTile(
            title: Center(
              child: Text(
                "3",
                style: GoogleFonts.roboto(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle: Center(
              child: Text(
                "Bài Đăng",
                style: GoogleFonts.roboto(fontSize: 13),
              ),
            ),
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
        child: ListTile(
          title: Center(
            child: Text(
              "12",
              style: GoogleFonts.roboto(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          subtitle: Center(
            child: Text(
              "Người Theo Dõi",
              style: GoogleFonts.roboto(fontSize: 13),
            ),
          ),
        ),
      ),
      Expanded(
        child: ListTile(
          title: Center(
            child: Text(
              "4",
              style: GoogleFonts.roboto(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          subtitle: Center(
            child: Text(
              "Đang Theo Dõi",
              style: GoogleFonts.roboto(fontSize: 13),
            ),
          ),
        ),
      ),
    ],
  );
}
