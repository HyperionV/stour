import 'package:flutter/material.dart';

List<Widget> buildProfileOptions(BuildContext context) {
  return [
    ListTile(
      leading: Icon(Icons.photo_library),
      title: Text('Photos'),
      onTap: () {
        // Implement the photos page navigation
      },
    ),
    ListTile(
      leading: Icon(Icons.favorite),
      title: Text('Favorites'),
      onTap: () {
        // Implement the favorites page navigation
      },
    ),
    ListTile(
      leading: Icon(Icons.settings),
      title: Text('Settings'),
      onTap: () {
        // Implement the settings page navigation
      },
    ),
  ];
}
