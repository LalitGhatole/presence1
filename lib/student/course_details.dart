import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'profile.dart';
import 'AssignmentDetailsPage.dart';
import 'Home.dart'; // Import the file where Course class is defined

class Assignment {
  final int assignmentNo;
  final String title;
  final String description;
  final DateTime submissionDate;
  final int? assessmentMarks;
  final bool isSubmitted;

  Assignment({
    required this.assignmentNo,
    required this.title,
    required this.description,
    required this.submissionDate,
    required this.assessmentMarks,
    required this.isSubmitted,
  });
}

class CourseDetailsPage extends StatefulWidget {
  final Course course;

  const CourseDetailsPage({Key? key, required this.course}) : super(key: key);

  @override
  _CourseDetailsPageState createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  String _selectedSection = 'Presence';
  double _attendancePercentage = 0;
  final List<String> _lectures = [
    'Lecture 1 - Attended - 2024-01-20 09:00 AM',
    'Lecture 2 - Attended - 2024-01-22 09:00 AM',
    'Lecture 3 - Attended - 2024-01-24 09:00 AM',
    'Lecture 4 - Absent - 2024-01-27 09:00 AM',
    'Lecture 5 - Attended - 2024-01-29 09:00 AM',
    'Lecture 6 - Attended - 2024-01-20 09:00 AM',
    'Lecture 7 - Absent - 2024-01-22 09:00 AM',
    'Lecture 8 - Absent - 2024-01-24 09:00 AM',
    'Lecture 9 - Attended - 2024-01-27 09:00 AM',
    'Lecture 10 - Attended - 2024-01-29 09:00 AM',
  ];
  bool _isFileAttached = false;
  late File _attachedFile;
  String _attachedFileName = '';

  // Dummy assignments
  List<Assignment> _assignments = [
    Assignment(
      assignmentNo: 1,
      title: 'Assignment 1',
      description: 'This is the description for Assignment 1.',
      submissionDate: DateTime(2024, 3, 10, 9, 0),
      assessmentMarks: null,
      isSubmitted: false,
    ),
    Assignment(
      assignmentNo: 2,
      title: 'Assignment 2',
      description: 'This is the description for Assignment 2.',
      submissionDate: DateTime(2024, 3, 5, 9, 0),
      assessmentMarks: null,
      isSubmitted: false,
    ),
    Assignment(
      assignmentNo: 3,
      title: 'Assignment 3',
      description: 'This is the description for Assignment 3.',
      submissionDate: DateTime(2024, 1, 31, 9, 0),
      assessmentMarks: null,
      isSubmitted: false,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _calculateAttendancePercentage();
  }

  void _calculateAttendancePercentage() {
    int totalLectures = _lectures.length;
    int attendedLectures =
        _lectures.where((lecture) => lecture.contains('Attended')).length;

    // Calculate attendance percentage based only on attended lectures
    if (totalLectures > 0) {
      setState(() {
        _attendancePercentage = (attendedLectures / totalLectures) * 100;
      });
    } else {
      setState(() {
        _attendancePercentage = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/presence_logo.png',
              height: 30,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              'Presence',
              style: TextStyle(
                fontSize: 20,
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
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Course: ${widget.course.name}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            _buildSectionNavigation(),
            const SizedBox(height: 20),
            if (_selectedSection == 'Presence') _buildPresenceSection(),
            if (_selectedSection == 'Assessment') _buildAssessmentSection(),
            if (_selectedSection == 'Details') _buildCourseDetailsSection(),
            // if (_selectedSection == 'Assessment') _buildAssessmentSection(),
            // Add condition for the syllabus section
          ],
        ),
      ),
    );
  }

  Widget _buildSectionNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSectionButton('Presence', _selectedSection == 'Presence'),
        _buildSectionButton('Assessment', _selectedSection == 'Assessment'),
        _buildSectionButton('Details', _selectedSection == 'Details'),
        // _buildSectionButton('Assignments', _selectedSection == 'Assignments'),
        // Add button for syllabus section
      ],
    );
  }

  Widget _buildSectionButton(String section, bool isActive) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedSection = section;
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          isActive ? Colors.blue : Colors.white,
        ),
      ),
      child: Text(
        section,
        style: TextStyle(color: isActive ? Colors.white : Colors.blue),
      ),
    );
  }

  Widget _buildPresenceSection() {
    return Column(
      children: [
        if (_attendancePercentage < 75) _buildWarningMessage(),
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: _attendancePercentage / 100),
          duration: const Duration(seconds: 1),
          builder: (BuildContext context, double value, Widget? child) {
            return SizedBox(
              height: 300,
              width: 300,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: CircularProgressIndicator(
                      value: value,
                      backgroundColor: Colors.grey[300],
                      valueColor: ColorTween(
                        begin: Colors.red,
                        end: _getProgressColor(),
                      ).animate(
                        const AlwaysStoppedAnimation<double>(1),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: CircularProgressIndicator(
                        value: value,
                        backgroundColor: Colors.transparent,
                        valueColor: ColorTween(
                          begin: Colors.red,
                          end: _getProgressColor(),
                        ).animate(
                          const AlwaysStoppedAnimation<double>(1),
                        ),
                        strokeWidth: 20,
                        semanticsLabel: 'Attendance Progress',
                      ),
                    ),
                  ),
                  Text(
                    '${_attendancePercentage.toInt()}%',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 10),
        _buildLectureAttendanceBox(),
      ],
    );
  }

  Widget _buildWarningMessage() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.red.withOpacity(0.2),
      child: const Text(
        'Warning: Attendance is low!',
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildLectureAttendanceBox() {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            _lectures.map((lecture) => _buildLectureTile(lecture)).toList(),
      ),
    );
  }

  Widget _buildLectureTile(String lecture) {
    List<String> lectureParts = lecture.split(' - ');
    String lectureName = lectureParts[0];
    String attendanceStatus = lectureParts[1];
    String dateTime = lectureParts[2];

    return ListTile(
      title: Text(
        lectureName,
        style: TextStyle(
          color:
              attendanceStatus.contains('Attended') ? Colors.green : Colors.red,
        ),
      ),
      subtitle: Text(dateTime),
    );
  }

  Color _getProgressColor() {
    if (_attendancePercentage >= 90) {
      return Colors.green;
    } else if (_attendancePercentage >= 75) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }

  Widget _buildAssessmentSection() {
    return Column(
      children: [
        for (Assignment assignment in _assignments)
          _buildAssignmentBox(assignment),
      ],
    );
  }

  Widget _buildAssignmentBox(Assignment assignment) {
    Color dateColor = _getDateColor(assignment.submissionDate);
    String dateText = _getFormattedDateText(assignment.submissionDate);
    String marksText = assignment.assessmentMarks != null
        ? "Marks: ${assignment.assessmentMarks}"
        : "Marks: N/A";

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: dateColor),
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200], // Changed background color
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Assignment ${assignment.assignmentNo}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 5),
          Text(
            assignment.title,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Submission Date: $dateText",
            style: TextStyle(
              color: dateColor,
            ),
          ),
          SizedBox(height: 5),
          Text(
            marksText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              _viewAssignmentDetails(assignment);
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero, // Remove padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              primary: Colors.blue, // Button color
            ),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "View Details",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getDateColor(DateTime submissionDate) {
    DateTime now = DateTime.now();
    Duration difference = submissionDate.difference(now);

    if (difference.inHours <= 24) {
      return Colors.red;
    } else if (difference.inHours <= 48) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  String _getFormattedDateText(DateTime submissionDate) {
    String formattedDate = submissionDate.toString();
    return formattedDate.substring(0, 16);
  }

  void _viewAssignmentDetails(Assignment assignment) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AssignmentDetailsPage(assignment: assignment),
      ),
    );
  }

  Widget _buildCourseDetailsSection() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 20), // Add horizontal padding
      child: Column(
        children: [
          _buildCourseDetailsBlock(), // Add Course Details block
          const SizedBox(height: 20), // Add gap between blocks
          _buildMarksBlock(), // Add Marks block
          const SizedBox(height: 20), // Add gap between blocks
          _buildSyllabusBlock(), // Add Syllabus block
        ],
      ),
    );
  }

  Widget _buildCourseDetailsBlock() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding
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
            const SizedBox(height: 10), // Add spacing between title and content
            ListTile(
              leading: const Icon(Icons.school), // Add icon
              title: Text('Course Name',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600])), // Adjust title styling
              subtitle: Text(widget.course.name,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black)), // Adjust subtitle styling
            ),
            const SizedBox(height: 10), // Add spacing between fields
            ListTile(
              leading: const Icon(Icons.domain), // Add icon
              title: Text('Domain',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600])), // Adjust title styling
              subtitle: const Text('snn',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black)), // Adjust subtitle styling
            ),
            const SizedBox(height: 10), // Add spacing between fields
            ListTile(
              leading: const Icon(Icons.person), // Add icon
              title: Text('Faculty',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600])), // Adjust title styling
              subtitle: const Text('snn',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black)), // Adjust subtitle styling
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
        padding: const EdgeInsets.all(16.0), // Add padding
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
            const SizedBox(height: 10), // Add spacing between title and content
            ListTile(
              leading: const Icon(Icons.school), // Add icon
              title: Text('University Marks',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600])), // Adjust title styling
              subtitle: const Text('80',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black)), // Adjust subtitle styling
            ),
            const SizedBox(height: 10), // Add spacing between fields
            ListTile(
              leading: const Icon(Icons.engineering), // Add icon
              title: Text('Practical Marks',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600])), // Adjust title styling
              subtitle: const Text('70',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black)), // Adjust subtitle styling
            ),
            const SizedBox(height: 10), // Add spacing between fields
            ListTile(
              leading: const Icon(Icons.assignment), // Add icon
              title: Text('CT Marks',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600])), // Adjust title styling
              subtitle: const Text('60',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black)), // Adjust subtitle styling
            ),
            const SizedBox(height: 10), // Add spacing between fields
            ListTile(
              leading: const Icon(Icons.person), // Add icon
              title: Text('Attendance',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600])), // Adjust title styling
              subtitle: const Text('75%',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black)), // Adjust subtitle styling
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
        padding: const EdgeInsets.all(16.0), // Add padding
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

  void _showProfileOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
