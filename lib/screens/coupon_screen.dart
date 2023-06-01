import 'package:flutter/material.dart';
import 'package:stour/widgets/coupon_card.dart';
import 'package:stour/util/coupon.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:stour/util/const.dart';

class CouponScreen extends StatefulWidget {
  const CouponScreen({super.key});
  @override
  State<CouponScreen> createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lụm mã giảm giá',
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: listCoupon.length,
        itemBuilder: (context, index) {
          return CouponCard(coupon: listCoupon[index]);
        },
      ),
    );
  }
}
