// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:provider/provider.dart'; // Import Provider
// import 'package:presence/login/ForgetPasswordPage.dart';
// import 'package:presence/login/RegistrationPage.dart';
// import 'package:presence/student/Home.dart';
// import 'package:presence/teacher/Home.dart';

// class UserProvider extends ChangeNotifier {
//   User? _user;
//   Map<String, dynamic>? _userData;

//   User? get user => _user;
//   Map<String, dynamic>? get userData => _userData;

//   void setUser(User? user) {
//     _user = user;
//     notifyListeners();
//   }

//   void setUserData(Map<String, dynamic>? userData) {
//     _userData = userData;
//     notifyListeners();
//   }
// }

// class LoginPage extends StatelessWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Presence'),
//         centerTitle: true,
//         backgroundColor: Colors.blue,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/images/presence_logo.png',
//               height: 100,
//             ),
//             const SizedBox(height: 20),
//             LoginForm(),
//             const SizedBox(height: 20),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const ForgetPasswordPage(),
//                   ),
//                 );
//               },
//               child: const Text(
//                 "Forgot Password?",
//                 style: TextStyle(
//                   color: Colors.blue,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text("Not registered? "),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const RegistrationPage(),
//                       ),
//                     );
//                   },
//                   child: const Text(
//                     "Register",
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class LoginForm extends StatefulWidget {
//   const LoginForm({Key? key}) : super(key: key);

//   @override
//   _LoginFormState createState() => _LoginFormState();
// }

// class _LoginFormState extends State<LoginForm> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 300,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 5,
//             blurRadius: 7,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           TextField(
//             controller: _emailController,
//             decoration: const InputDecoration(
//               hintText: 'Email',
//               icon: Icon(Icons.email),
//             ),
//           ),
//           const SizedBox(height: 20),
//           TextField(
//             controller: _passwordController,
//             obscureText: true,
//             decoration: const InputDecoration(
//               hintText: 'Password',
//               icon: Icon(Icons.lock),
//             ),
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () async {
//               String email = _emailController.text.trim();
//               String password = _passwordController.text.trim();

//               try {
//                 UserCredential userCredential =
//                     await FirebaseAuth.instance.signInWithEmailAndPassword(
//                   email: email,
//                   password: password,
//                 );

//                 DocumentSnapshot<Map<String, dynamic>> userData =
//                     await FirebaseFirestore.instance
//                         .collection('users')
//                         .doc(userCredential.user!.uid)
//                         .get();

//                 Provider.of<UserProvider>(context, listen: false)
//                     .setUser(userCredential.user);
//                 Provider.of<UserProvider>(context, listen: false)
//                     .setUserData(userData.data());

//                 String role = userData['role'];

//                 if (role == 'student') {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => StudentHomePage(),
//                     ),
//                   );
//                 } else if (role == 'teacher') {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => TeacherHomePage(),
//                     ),
//                   );
//                 } else {
//                   // Handle other roles or error cases
//                 }
//               } catch (error) {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: const Text('Authentication Failed'),
//                       content: const Text(
//                           'Invalid email or password. Please try again.'),
//                       actions: <Widget>[
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: const Text('OK'),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               }
//             },
//             child: const Text('Login'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => UserProvider(),
//       child: const MaterialApp(
//         home: LoginPage(),
//       ),
//     ),
//   );
// }
