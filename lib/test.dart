// // import 'package:flutter/material.dart';

// class TeacherHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Teacher Dashboard'),
//       ),
//       body: GridView.count(
//         crossAxisCount: 2,
//         children: [
//           _buildTile(
//             context,
//             title: 'Start Attendance',
//             icon: Icons.people,
//             onPressed: () {
//               // Handle start attendance action
//             },
//           ),
//           _buildTile(
//             context,
//             title: 'New Assessment',
//             icon: Icons.assignment,
//             onPressed: () {
//               // Handle new assessment action
//             },
//           ),
//           _buildTile(
//             context,
//             title: 'Total Enrolled Students',
//             icon: Icons.group,
//             onPressed: () {
//               // Handle total enrolled students action
//             },
//           ),
//           _buildTile(
//             context,
//             title: 'Reports',
//             icon: Icons.analytics,
//             onPressed: () {
//               // Handle reports action
//             },
//           ),
//           _buildTile(
//             context,
//             title: 'Notifications',
//             icon: Icons.notifications,
//             onPressed: () {
//               // Handle notifications action
//             },
//           ),
//           _buildTile(
//             context,
//             title: 'Course Details',
//             icon: Icons.details,
//             onPressed: () {
//               // Handle course details action
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTile(BuildContext context,
//       {required String title, required IconData icon, required VoidCallback onPressed}) {
//     return Card(
//       margin: EdgeInsets.all(16.0),
//       child: InkWell(
//         onTap: onPressed,
//         child: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(
//                 icon,
//                 size: 50.0,
//                 color: Theme.of(context).primaryColor,
//               ),
//               SizedBox(height: 10.0),
//               Text(
//                 title,
//                 style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: TeacherHomePage(),
//     theme: ThemeData(
//       primaryColor: Colors.blue, // Change to your desired primary color
//     ),
//   ));
// }
