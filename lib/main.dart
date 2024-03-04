import 'package:flutter/material.dart';
// import 'package:presence/student/Home.dart';
import 'package:presence/login/LoginPage.dart'; // Import your login page file

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Presence', // Your app title
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(), // Navigate to your login page
      debugShowCheckedModeBanner: false, // Remove debug banner
    );
  }
}
