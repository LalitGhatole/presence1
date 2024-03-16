import 'package:flutter/material.dart';
import '../lib/teacher/bar/Profile.dart';

void showProfileOptions(BuildContext context, String profilePhotoUrl) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(profilePhotoUrl),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'John Doe', // Dummy user name
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Computer Science and Engineering, 3rd Year', // Dummy branch and year
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('View Profile'),
              onTap: () {
                // Handle view profile option
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                ).then((_) {
                  Navigator.pop(context); // Dismiss the bottom sheet
                });
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.red, // Set logout icon color to red
              ),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                // Handle logout option
                showLogoutConfirmation(context);
              },
            ),
          ],
        ),
      );
    },
  );
}

void dismissProfileOptions(BuildContext context) {
  Navigator.of(context).pop();
}

void showLogoutConfirmation(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss the dialog
            },
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              // Perform logout action
              // For demonstration purposes, just navigate to login page
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ],
      );
    },
  );
}
