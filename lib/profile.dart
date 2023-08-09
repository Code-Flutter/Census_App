import 'package:census_app/auth.dart';
import 'package:census_app/home.dart';
import 'package:census_app/login.dart';
import 'package:census_app/play.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Profile Page",
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool showPassword = false;

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blueAccent,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Play()),
              );
            },
            icon: Icon(
              Icons.settings,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Profile",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
              SizedBox(height: 30),
              buildTextField("First Name", "John", false),
              buildTextField("Last Name", "Doe", false),
              buildTextField("E-mail", "johndoe@gmail.com", false),
              buildTextField("Username", "johndoe", false),
              buildTextField("Position", "Data Collector", false),
              buildTextField("Location", "Your Location", false),
              SizedBox(height: 20), // Added some space before the button
              ElevatedButton(
                onPressed: () async {
                  // Assuming _auth is an instance of your authentication class
                  await _auth.logOut();
                  print('Logged out Successfully');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    String labelText,
    String placeholder,
    bool isPasswordTextField,
  ) {
    return TextField(
      obscureText: isPasswordTextField ? showPassword : false,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.blueAccent),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
        suffixIcon: isPasswordTextField
            ? IconButton(
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                icon: Icon(
                  showPassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              )
            : null,
      ),
    );
  }
}
