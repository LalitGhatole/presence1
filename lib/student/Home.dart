import 'package:flutter/material.dart';
import 'course_details.dart';
import 'Profile.dart';

class Course {
  final String name;
  final int semester;
  final IconData iconData;

  Course({required this.name, required this.semester, required this.iconData});
}

class Home extends StatelessWidget {
  final List<Course> enrolledCourses = [
    Course(name: 'Math', semester: 1, iconData: Icons.school),
    Course(name: 'Science', semester: 2, iconData: Icons.school),
    Course(name: 'History', semester: 3, iconData: Icons.school),
    Course(name: 'Computer Science', semester: 4, iconData: Icons.school),
    Course(name: 'Electrical Engineering', semester: 5, iconData: Icons.school),
    Course(name: 'Mechanical Engineering', semester: 6, iconData: Icons.school),
    // Add more courses as needed
  ];

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/presence_logo.png', // Your app logo
              height: 30, // Adjust the height as needed
              fit: BoxFit.contain, // Ensure the logo fits within its container
            ),
            const SizedBox(
                width: 5), // Adjust the spacing between the logo and text
            const Text(
              'Presence', // Your app name or text
              style: TextStyle(
                fontSize: 20, // Adjust the font size as needed
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Doe', // Dummy user name
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Computer Science and Engineering, 3rd Year', // Dummy branch and year
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                // Handle profile option
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                ).then((_) {
                  Navigator.pop(context); // Dismiss the bottom sheet
                });
                _dismissProfileOptions(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {
                // Handle notifications option
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_phone),
              title: const Text('Contact Us'),
              onTap: () {
                // Handle contact option
              },
            ),
            ListTile(
              leading: const Icon(Icons.feedback),
              title: const Text('Feedback'),
              onTap: () {
                // Handle feedback option
              },
            ),
            ListTile(
              leading: const Icon(Icons.app_settings_alt),
              title: const Text('About App'),
              onTap: () {
                // Handle About App option
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Developer'),
              onTap: () {
                // Handle About Developer option
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: enrolledCourses.length,
        itemBuilder: (context, index) {
          final course = enrolledCourses[index];
          return CourseBlock(course: course);
        },
      ),
    );
  }

  void _showProfileOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'John Doe', // Dummy user name
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Computer Science and Engineering, 3rd Year', // Dummy branch and year
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('View Profile'),
                onTap: () {
                  // Handle view profile option
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  ).then((_) {
                    Navigator.pop(context); // Dismiss the bottom sheet
                  });
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red, // Set logout icon color to red
                ),
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  // Handle logout option
                  _showLogoutConfirmation(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _dismissProfileOptions(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                // Perform logout action
                // For demonstration purposes, just navigate to login page
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        );
      },
    );
  }
}

class CourseBlock extends StatefulWidget {
  final Course course;

  const CourseBlock({Key? key, required this.course}) : super(key: key);

  @override
  _CourseBlockState createState() => _CourseBlockState();
}

class _CourseBlockState extends State<CourseBlock> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle tapping on a course block
        // For example, navigate to course details page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseDetailsPage(course: widget.course),
          ),
        );
      },
      onHover: (value) {
        setState(() {
          _isHovered = value;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: _isHovered
              ? Colors.blue.withOpacity(0.1)
              : Colors.lightBlue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.school,
                  size: 40,
                  color: Colors.blue, // All icons are blue
                ),
                const SizedBox(height: 10),
                Text(
                  widget.course.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  'Semester: ${widget.course.semester}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Handle tapping on a course block
                // For example, navigate to course details page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CourseDetailsPage(course: widget.course),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _isHovered ? Colors.blue : Colors.lightBlue,
              ),
              child: const Text(
                'View Details',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}
