import "package:flutter/material.dart";
import "package:stour/util/const.dart";
import "package:stour/widgets/search_card.dart";

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildSearchBar(BuildContext context) {
      return Container(
          margin: const EdgeInsets.fromLTRB(10, 5, 10, 0), child: SearchCard());
    }

    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 246, 240, 120),
                boxShadow: [
                  BoxShadow(color: Colors.black, blurRadius: 6),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.sort_rounded,
                size: 24,
              ),
            ),
          ),
          const Row(
            children: [
              Icon(
                Icons.location_on,
                color: Color.fromARGB(255, 246, 240, 120),
              ),
              Text(
                "Current",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              SearchCard();
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 246, 240, 120),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 1, 210, 142),
                    blurRadius: 6,
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: GestureDetector(
                onTap: () {
                  buildSearchBar(context);
                },
                child: const Icon(
                  Icons.search,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
