import 'package:flutter/material.dart';
import 'bar/app_bar.dart';
import 'bar/profile.dart';
import 'options/course_details.dart';
// import 'options/email.dart';

class TeacherHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(profilePhotoUrl: 'assets/images/profile.png'),
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
                    builder: (context) => ProfilePage(),
                  ),
                );
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
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildTile(
            context,
            title: 'Attendance',
            icon: Icons.people,
            onPressed: () {
              // Handle start attendance action
            },
          ),
          _buildTile(
            context,
            title: 'Assessment',
            icon: Icons.assignment,
            onPressed: () {
              // Handle new assessment action
            },
          ),
          _buildTile(
            context,
            title: 'Total Enrolled Students',
            icon: Icons.group,
            onPressed: () {
              // Handle total enrolled students action
            },
          ),
          _buildTile(
            context,
            title: 'Reports',
            icon: Icons.analytics,
            onPressed: () {
              // Handle reports action
            },
          ),
          _buildTile(
            context,
            title: 'Email',
            icon: Icons.email,
            onPressed: () {
              // Navigator.push(
              //   context,
              // MaterialPageRoute(builder: (context) => EmailComposer()),
              // );
            },
          ),
          _buildTile(
            context,
            title: 'Course Details',
            icon: Icons.details,
            onPressed: () {
              // Navigate to the CourseDetailsPage when the tile is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CourseDetailsPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTile(BuildContext context,
      {required String title,
      required IconData icon,
      required VoidCallback onPressed}) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 50.0,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(height: 10.0),
              Text(
                title,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TeacherHomePage(),
    theme: ThemeData(
      primaryColor: Colors.blue, // Change to your desired primary color
    ),
  ));
}
