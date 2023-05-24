import 'package:flutter/material.dart';

List<Widget> buildProfileOptions(BuildContext context) {
  return [
    ListTile(
      leading: const Icon(Icons.photo_library),
      title: const Text('Photos'),
      onTap: () {
        // Implement the photos page navigation
      },
    ),
    ListTile(
      leading: const Icon(Icons.favorite),
      title: const Text('Favorites'),
      onTap: () {
        // Implement the favorites page navigation
      },
    ),
    ListTile(
      leading: const Icon(Icons.settings),
      title: const Text('Settings'),
      onTap: () {
        // Implement the settings page navigation
      },
    ),
  ];
}
