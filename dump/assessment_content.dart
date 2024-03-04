// import 'package:flutter/material.dart';
// // Assuming Assignment class is defined in this file

// class AssessmentContent extends StatelessWidget {
//   const AssessmentContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // Replace this with your desired UI for assessment content
//       child: Column(
//         children: [
//           const Text(
//             'Assessment Section',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           _buildAssessmentList(),
//         ],
//       ),
//     );
//   }

//   Widget _buildAssessmentList() {
//     // Generate dummy assignments data
//     List<Assignment> assignments = _generateDummyAssignments();

//     // Build list of assignment widgets
//     return Column(
//       children: assignments.map((assignment) {
//         return ListTile(
//           title: Text(assignment.title),
//           subtitle: Text('Deadline: ${assignment.deadline.toString()}'),
//         );
//       }).toList(),
//     );
//   }

//   List<Assignment> _generateDummyAssignments() {
//     // Generate dummy assignments data
//     return List.generate(
//       5,
//       (index) => Assignment(
//         title: 'Assignment ${index + 1}',
//         deadline: DateTime.now().add(Duration(days: index + 1)), // Set deadlines incrementally
//         isSubmittedOnTime: index % 2 == 0, // Alternate between true and false
//       ),
//     );
//   }
// }
