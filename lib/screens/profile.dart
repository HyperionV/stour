import 'package:stour/widgets/profile_img.dart';
import 'package:stour/widgets/profile_option.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF667EEA), Color(0xFF64B6FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: ListView(
          children: [
            const ProfileImage(),
            const SizedBox(height: 16),
            const ProfileHeader(),
            const SizedBox(height: 16),
            ...buildProfileOptions(context),
          ],
        ),
      ),
    );
  }
}
