// import 'package:flutter/material.dart';

// class PresenceContent extends StatelessWidget {
//   const PresenceContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         if (_attendancePercentage < 75)
//           _buildWarningMessage(), // Updated condition
//         TweenAnimationBuilder(
//           tween: Tween<double>(begin: 0, end: _attendancePercentage / 100),
//           duration: const Duration(seconds: 1),
//           builder: (BuildContext context, double value, Widget? child) {
//             return SizedBox(
//               height: 300,
//               width: 300,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   SizedBox(
//                     height: 200,
//                     width: 200,
//                     child: CircularProgressIndicator(
//                       value: value,
//                       backgroundColor: Colors.grey[300],
//                       valueColor: ColorTween(
//                         begin: Colors.red,
//                         end: _getProgressColor(),
//                       ).animate(
//                         const AlwaysStoppedAnimation<double>(1),
//                       ),
//                     ),
//                   ),
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(100),
//                     child: SizedBox(
//                       height: 200,
//                       width: 200,
//                       child: CircularProgressIndicator(
//                         value: value,
//                         backgroundColor: Colors.transparent,
//                         valueColor: ColorTween(
//                           begin: Colors.red,
//                           end: _getProgressColor(),
//                         ).animate(
//                           const AlwaysStoppedAnimation<double>(1),
//                         ),
//                         strokeWidth: 20,
//                         semanticsLabel: 'Attendance Progress',
//                       ),
//                     ),
//                   ),
//                   Text(
//                     '${_attendancePercentage.toInt()}%',
//                     style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//         const SizedBox(height: 10),
//         _buildLectureAttendanceBox(),
//       ],
//     );
//   }

//   Widget _buildWarningMessage() {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       color: Colors.red.withOpacity(0.2),
//       child: const Text(
//         'Warning: Attendance is low!',
//         style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
//       ),
//     );
//   }

//   Widget _buildLectureAttendanceBox() {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       margin: const EdgeInsets.symmetric(horizontal: 20),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.grey[200],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children:
//             _lectures.map((lecture) => _buildLectureTile(lecture)).toList(),
//       ),
//     );
//   }

//   Widget _buildLectureTile(String lecture) {
//     List<String> lectureParts = lecture.split(' - ');
//     String lectureName = lectureParts[0];
//     String attendanceStatus = lectureParts[1];
//     String dateTime = lectureParts[2];

//     return ListTile(
//       title: Text(
//         lectureName,
//         style: TextStyle(
//           color:
//               attendanceStatus.contains('Attended') ? Colors.green : Colors.red,
//         ),
//       ),
//       subtitle: Text(dateTime),
//     );
//   }

//   Color _getProgressColor() {
//     if (_attendancePercentage >= 90) {
//       return Colors.green;
//     } else if (_attendancePercentage >= 75) {
//       return Colors.yellow;
//     } else {
//       return Colors.red;
//     }
//   }
// }
