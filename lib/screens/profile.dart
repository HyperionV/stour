import 'package:stour/widgets/profile_img.dart';
import 'package:stour/widgets/profile_option.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF667EEA), Color(0xFF64B6FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: ListView(
          children: [
            ProfileImage(),
            SizedBox(height: 16),
            ProfileHeader(),
            SizedBox(height: 16),
            ...buildProfileOptions(context),
          ],
        ),
      ),
    );
  }
}
