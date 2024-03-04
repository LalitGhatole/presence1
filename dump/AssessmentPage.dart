// class AssessmentPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Sample assignment data
//     List<Assignment> assignments = [
//       Assignment(
//         title: 'Assignment 1',
//         deadline: DateTime(2024, 12, 31),
//         totalMarks: 100,
//         isSubmitted: false,
//         isSubmittedOnTime: false,
//         description: 'Description of Assignment 1',
//         attachedFile: 'file.txt',
//         onShowDetails: () {
//           // Implement show details functionality
//         },
//       ),
//       Assignment(
//         title: 'Assignment 2',
//         deadline: DateTime(2024, 12, 15),
//         totalMarks: 50,
//         isSubmitted: true,
//         isSubmittedOnTime: true,
//         description: 'Description of Assignment 2',
//         attachedFile: null,
//         onShowDetails: () {
//           // Implement show details functionality
//         },
//       ),
//       // Add more assignments here
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Assessment'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Upcoming Assignments',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             AssessmentContent(assignments: assignments),
//           ],
//         ),
//       ),
//     );
//   }
// }
