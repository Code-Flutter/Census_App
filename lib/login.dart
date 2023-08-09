import 'package:Census/auth.dart';
import 'package:Census/navrbarpage.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Census2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 150.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter your Email', // Placeholder text
                  ),
                  validator: (val) {
                    if (val?.isEmpty == true) {
                      return 'Enter Email';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(height: 50.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Password', // Placeholder text
                  ),
                  validator: (val) {
                    if (val?.isEmpty == true) {
                      return 'Enter Password';
                    } else {
                      return null;
                    }
                  },
                  obscureText: true,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                Text(error),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () async {
                      if (_formKey.currentState?.validate() == true) {
                        dynamic result =
                            await _auth.signInWithEmail(email, password);
                        if (result == null) {
                          setState(() {
                            error = 'Wrong Credentials';
                          });
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        }
                        ;
                      } else {}
                    },
                    child: Text('Sign In'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
