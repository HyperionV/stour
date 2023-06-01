import 'package:flutter/material.dart';
import 'package:stour/screens/question_screen.dart';
import 'package:stour/util/coupon.dart';

class CouponCard extends StatefulWidget {
  final Coupon coupon;
  const CouponCard({super.key, required this.coupon});

  @override
  State<CouponCard> createState() => _CouponCardState();
}

class _CouponCardState extends State<CouponCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(bottom: 30, top: 30, left: 30, right: 30),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return QuestionScreen(
                        listquestion: widget.coupon.listQuestion);
                  },
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 40, 179, 230),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ]),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 9,
                  child: Center(
                    child: Text(
                      widget.coupon.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 24,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            )));
  }
}
