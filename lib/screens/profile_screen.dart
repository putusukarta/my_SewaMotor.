import 'package:flutter/material.dart';
import 'package:my_app/screens/login_screen.dart';
import 'package:my_app/screens/routes/SecondScreen/second_screen.dart';
import 'package:my_app/screens/home_screen.dart'; 

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = 'I Putu Sukarta Yasa';
  String _email = 'putusukartayasa@gmail.com';
  String _phoneNumber = '087851213365';
  String _profileImage = 'assets/images/icon3_flutter.png';

  bool _loggingOut = false;

  void _logOut(BuildContext context) {
    setState(() {
      _loggingOut = true;
    });
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _loggingOut
            ? Center(child: CircularProgressIndicator())
            : Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/news-screen');
                      },
                      child: Text('Get Data', style: TextStyle(color: Colors.blue)),
                    ),
                    SizedBox(height: 20),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                        ),
                        CircleAvatar(
                          radius: 56,
                          backgroundImage: AssetImage(_profileImage),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'User Information',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildTextField('Name', initialValue: _name, onChanged: (value) {
                      setState(() {
                        _name = value;
                      });
                    }),
                    SizedBox(height: 20),
                    _buildTextField('Email', initialValue: _email, onChanged: (value) {
                      setState(() {
                        _email = value;
                      });
                    }),
                    SizedBox(height: 20),
                    _buildTextField('Phone Number', initialValue: _phoneNumber, onChanged: (value) {
                      setState(() {
                        _phoneNumber = value;
                      });
                    }),
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton.icon(
                        onPressed: () => _logOut(context),
                        icon: Icon(Icons.logout, color: Colors.white),
                        label: Text('Log out', style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildTextField(String title,
      {required String initialValue, required ValueChanged<String> onChanged}) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue),
        ),
        prefixIcon: Icon(Icons.person),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}
