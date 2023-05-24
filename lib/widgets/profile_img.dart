import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.grey,
      child: const CircleAvatar(
        radius: 80,
        backgroundImage: NetworkImage(
            'https://i.pinimg.com/236x/0a/b5/9e/0ab59e7c8e7a1213ff1ee891e98e06ae.jpg?nii=t'),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Username',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Bio',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          Neumorphic(
            style: const NeumorphicStyle(
              shape: NeumorphicShape.convex,
              depth: 4,
              lightSource: LightSource.topLeft,
              color: Colors.white,
            ),
            child: ElevatedButton(
              onPressed: () {
                // Implement the edit profile functionality
              },
              style: ElevatedButton.styleFrom(
                elevation: 0, // Remove elevation to match neumorphic design
                backgroundColor: Colors
                    .transparent, // Make the button background transparent
                foregroundColor: Colors.grey, // Set text color
              ),
              child: const Text('Edit Profile'),
            ),
          ),
        ],
      ),
    );
  }
}
