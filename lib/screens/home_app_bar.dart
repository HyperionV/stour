import "package:flutter/material.dart";
import "package:stour/util/const.dart";
import "package:stour/widgets/search_card.dart";
import 'package:stour/screens/coupon_screen.dart';

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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const CouponScreen();
                  },
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Constants.lightgreen,
                boxShadow: [
                  BoxShadow(color: Constants.ratingBG, blurRadius: 10),
                ],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.discount_outlined,
                color: Color.fromARGB(255, 35, 52, 10),
                size: 24,
              ),
            ),
          ),
          const Spacer(),
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
                    color: Constants.ratingBG,
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
