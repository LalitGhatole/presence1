import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:presence/firebase_options.dart';
import 'package:presence/login/LoginPage.dart'; // Import your login page file
import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
