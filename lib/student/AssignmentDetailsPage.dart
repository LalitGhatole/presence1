import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'course_details.dart';

class AssignmentDetailsPage extends StatefulWidget {
  final Assignment assignment;

  const AssignmentDetailsPage({Key? key, required this.assignment})
      : super(key: key);

  @override
  _AssignmentDetailsPageState createState() => _AssignmentDetailsPageState();
}

class _AssignmentDetailsPageState extends State<AssignmentDetailsPage> {
  late File _attachedFile;
  String _attachedFileName = '';
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    DateTime submissionTime = widget.assignment.submissionDate;
    Duration timeDifference = submissionTime.difference(currentTime);
    int hoursRemaining = timeDifference.inHours;

    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment ${widget.assignment.assignmentNo} Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Assignment Title: ${widget.assignment.title}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Description: ${widget.assignment.description}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Submission Date: ${_getFormattedDateTime(submissionTime)}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Time Remaining: $hoursRemaining hours',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Marks: ${widget.assignment.assessmentMarks != null ? widget.assignment.assessmentMarks : 'N/A'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isSubmitting ? null : _pickFile,
              child: Text('Attach File'),
            ),
            SizedBox(height: 10),
            if (_attachedFileName.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Attached File: $_attachedFileName',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Add logic to view the attached file
                          },
                          child: Text('View File'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  _attachedFileName.isNotEmpty ? _submitAssignment : null,
              child: Text('Submit Assignment'),
            ),
            SizedBox(height: 20),
            _isSubmitting
                ? CircularProgressIndicator()
                : SizedBox(), // Show loading indicator when submitting
          ],
        ),
      ),
    );
  }

  String _getFormattedDateTime(DateTime dateTime) {
    return DateFormat.yMMMd().add_jm().format(dateTime);
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _attachedFile = File(result.files.single.path!);
        _attachedFileName = result.files.single.name;
      });
    }
  }

  void _submitAssignment() {
    setState(() {
      _isSubmitting = true;
    });

    // Simulate submission process
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isSubmitting = false;
        _showSubmissionSuccess();
      });
    });
  }

  void _showSubmissionSuccess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Assignment submitted successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
