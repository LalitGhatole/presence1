// app_bar.dart

import 'package:flutter/material.dart';
import 'Profile.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String profilePhotoUrl; // Add profilePhotoUrl parameter

  const CustomAppBar({Key? key, required this.profilePhotoUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/presence_logo.png', // Your app logo
            height: 30, // Adjust the height as needed
            fit: BoxFit.contain, // Ensure the logo fits within its container
          ),
          const SizedBox(width: 5), // Adjust the spacing between the logo and text
          const Text(
            'Presence', // Your app name or text
            style: TextStyle(
              fontSize: 20, // Adjust the font size as needed
            ),
          ),
        ],
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
      actions: [
        GestureDetector(
          onTap: () {
            _showProfileOptions(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(profilePhotoUrl), // Use profile photo URL here
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  void _showProfileOptions(BuildContext context) {
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
                  _showLogoutConfirmation(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
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
}
