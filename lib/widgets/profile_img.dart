import 'package:flutter_neumorphic/flutter_neumorphic.dart';

Stack profileImage(Size size) {
  return Stack(
    children: [
      Container(
        width: size.width,
        height: 200,
        color: Colors.transparent,
        padding: const EdgeInsets.only(bottom: 150 / 2.2),
        child: Container(
          width: size.width,
          height: 150,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(10, 10),
                bottomRight: Radius.elliptical(10, 10)),
            image: DecorationImage(
              image: NetworkImage(
                  "https://i.pinimg.com/236x/0a/b5/9e/0ab59e7c8e7a1213ff1ee891e98e06ae.jpg?nii=t"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),

      // * user profile image
      Positioned(
        top: 100,
        left: size.width / 2 - 50,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white, width: 3),
              shape: BoxShape.circle),
          child: const CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(
                "https://i.pinimg.com/236x/0a/b5/9e/0ab59e7c8e7a1213ff1ee891e98e06ae.jpg?nii=t"),
          ),
        ),
      ),
    ],
  );
}
