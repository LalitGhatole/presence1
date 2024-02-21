import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String? _selectedBranch;
  String? _selectedYear;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _studentIdController = TextEditingController();
  TextEditingController _studentRollController = TextEditingController();
  File? _image;

  final List<String> branches = [
    'Branch A',
    'Branch B',
    'Branch C'
  ]; // Example list of branches
  final List<String> years = [
    '1st Year',
    '2nd Year',
    '3rd Year'
  ]; // Example list of years

  @override
  void initState() {
    super.initState();
    _selectedBranch = branches[0]; // Set initial value for branch
    _selectedYear = years[0]; // Set initial value for year
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _contactController.dispose();
    _studentIdController.dispose();
    _studentRollController.dispose();
    super.dispose();
  }

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

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
            SizedBox(width: 5), // Adjust the spacing between the logo and text
            Text(
              'Presence', // Your app name or text
              style: TextStyle(
                fontSize: 20, // Adjust the font size as needed
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                width: 380,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        icon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        icon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        icon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _contactController,
                      decoration: InputDecoration(
                        labelText: 'Contact',
                        icon: Icon(Icons.phone),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _studentIdController,
                      decoration: InputDecoration(
                        labelText: 'Student ID',
                        icon: Icon(Icons.badge),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _studentRollController,
                      decoration: InputDecoration(
                        labelText: 'Roll No',
                        icon: Icon(Icons.format_list_numbered),
                      ),
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: _selectedBranch,
                      onChanged: (value) {
                        setState(() {
                          _selectedBranch = value;
                        });
                      },
                      items: branches.map((branch) {
                        return DropdownMenuItem<String>(
                          value: branch,
                          child: Text(branch),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: 'Branch',
                      ),
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: _selectedYear,
                      onChanged: (value) {
                        setState(() {
                          _selectedYear = value;
                        });
                      },
                      items: years.map((year) {
                        return DropdownMenuItem<String>(
                          value: year,
                          child: Text(year),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: 'Year',
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Clear all fields
                              _firstNameController.clear();
                              _lastNameController.clear();
                              _emailController.clear();
                              _contactController.clear();
                              _studentIdController.clear();
                              _studentRollController.clear();
                              setState(() {
                                _selectedBranch = branches[0];
                                _selectedYear = years[0];
                                _image = null; // Clear the profile picture
                              });
                            },
                            child: Text('Clear'),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Register logic
                            },
                            child: Text('Register'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Open file system or camera to pick image
                        _showImageSourceDialog();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.camera_alt),
                          SizedBox(width: 10),
                          Text('Upload Picture'),
                        ],
                      ),
                    ),
                    if (_image != null) SizedBox(height: 20),
                    if (_image != null)
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(_image!),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showImageSourceDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose Profile Picture'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text('Gallery'),
                  onTap: () {
                    _getImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                GestureDetector(
                  child: Text('Camera'),
                  onTap: () {
                    _getImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


void main() {
  runApp(MaterialApp(
    home: RegistrationPage(),
  ));
}
