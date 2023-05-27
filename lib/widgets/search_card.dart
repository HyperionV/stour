import 'package:flutter/material.dart';
import 'package:stour/model/place.dart';

class SearchCard extends StatelessWidget {
  SearchCard({super.key});
  final TextEditingController _searchControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: TextField(
        onChanged: (text) {
          // print('First text field: $text');
          SearchByNameWidget(text);
        },
        style: const TextStyle(
          fontSize: 15.0,
          color: Color.fromARGB(255, 35, 52, 10),
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          hintText: "Nhập từ khóa để tìm kiếm...",
          prefixIcon: const Icon(
            Icons.search,
            color: Color.fromARGB(255, 35, 52, 10),
          ),
          suffixIcon: const Icon(
            Icons.filter_list,
            color: Color.fromARGB(255, 35, 52, 10),
          ),
          hintStyle: const TextStyle(
            fontSize: 15.0,
            color: Color.fromARGB(255, 35, 52, 10),
          ),
        ),
        maxLines: 1,
        controller: _searchControl,
      ),
    );
  }
}
