import 'package:flutter/material.dart';
import 'package:presence/login/LoginPage.dart'; // Import your login page file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Presence', // Your app title
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Navigate to your login page
    );
  }
}
