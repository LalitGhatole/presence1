import 'package:flutter/material.dart';

class CourseDetailsPage extends StatefulWidget {
  @override
  _CourseDetailsPageState createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Details'),
      ),
      body: SingleChildScrollView(
        child: _buildCourseDetailsSection(),
      ),
    );
  }

  Widget _buildCourseDetailsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildCourseDetailsBlock(),
          const SizedBox(height: 20),
          _buildMarksBlock(),
          const SizedBox(height: 20),
          _buildSyllabusBlock(),
        ],
      ),
    );
  }

  Widget _buildCourseDetailsBlock() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Course Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.school),
              title: Text('Course Name',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              subtitle: Text('Computer Science', // Dummy course name
                  style: const TextStyle(fontSize: 18, color: Colors.black)),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.domain),
              title: Text('Domain',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              subtitle: const Text('Computer Engineering', // Dummy domain
                  style: TextStyle(fontSize: 18, color: Colors.black)),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text('Faculty',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              subtitle: const Text('John Doe', // Dummy faculty name
                  style: TextStyle(fontSize: 18, color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMarksBlock() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Marks',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.school),
              title: Text('University Marks',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              subtitle: const Text('80', // Dummy university marks
                  style: TextStyle(fontSize: 18, color: Colors.black)),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.engineering),
              title: Text('Practical Marks',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              subtitle: const Text('70', // Dummy practical marks
                  style: TextStyle(fontSize: 18, color: Colors.black)),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.assignment),
              title: Text('CT Marks',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              subtitle: const Text('60', // Dummy CT marks
                  style: TextStyle(fontSize: 18, color: Colors.black)),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text('Attendance',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              subtitle: const Text('75%', // Dummy attendance
                  style: TextStyle(fontSize: 18, color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSyllabusBlock() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Syllabus',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            _buildSyllabusBox('Chapter 1: Introduction', [
              'Subtopic 1',
              'Subtopic 2',
              'Subtopic 3',
            ]),
            _buildSyllabusBox('Chapter 2: Fundamentals', [
              'Subtopic 1',
              'Subtopic 2',
              'Subtopic 3',
            ]),
            _buildSyllabusBox('Chapter 3: Advanced Topics', [
              'Subtopic 1',
              'Subtopic 2',
              'Subtopic 3',
            ]),
            _buildSyllabusBox('Chapter 4: Case Studies', [
              'Subtopic 1',
              'Subtopic 2',
              'Subtopic 3',
            ]),
            _buildSyllabusBox('Chapter 5: Conclusion', [
              'Subtopic 1',
              'Subtopic 2',
              'Subtopic 3',
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSyllabusBox(String chapter, List<String> subtopics) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            chapter,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: subtopics
                .map((subtopic) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(subtopic),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
