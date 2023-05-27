import "package:flutter/material.dart";
import "package:stour/util/const.dart";
import "package:stour/widgets/search_card.dart";

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    Widget buildSearchBar(BuildContext context) {
      return Container(
          margin: const EdgeInsets.fromLTRB(10, 5, 10, 0), child: SearchCard());
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Constants.lightgreen,
                boxShadow: [
                  BoxShadow(color: Constants.darkpp, blurRadius: 10),
                ],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.sort_rounded,
                color: Color.fromARGB(255, 35, 52, 10),
                size: 24,
              ),
            ),
          ),
          const Row(
            children: [
              Icon(
                Icons.location_on,
                color: Color.fromARGB(255, 35, 52, 10),
              ),
              Text(
                "Current",
                style: TextStyle(
                  color: Color.fromARGB(255, 35, 52, 10),
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
                color: Constants.lightgreen,
                boxShadow: [
                  BoxShadow(
                    color: Constants.darkpp,
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.circular(16),
              ),
              child: GestureDetector(
                onTap: () {
                  buildSearchBar(context);
                },
                child: const Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 35, 52, 10),
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
