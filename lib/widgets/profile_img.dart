import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.grey,
      child: CircleAvatar(
        radius: 80,
        backgroundImage: NetworkImage('https://example.com/profile_image.jpg'),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Username',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Bio',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 16),
          Neumorphic(
            style: NeumorphicStyle(
              shape: NeumorphicShape.convex,
              depth: 4,
              lightSource: LightSource.topLeft,
              color: Colors.white,
            ),
            child: ElevatedButton(
              onPressed: () {
                // Implement the edit profile functionality
              },
              child: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                elevation: 0, // Remove elevation to match neumorphic design
                backgroundColor: Colors
                    .transparent, // Make the button background transparent
                foregroundColor: Colors.grey, // Set text color
              ),
            ),
          ),
        ],
      ),
    );
  }
}
