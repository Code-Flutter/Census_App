import 'package:Census/auth.dart';
import 'package:Census/navrbarpage.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  bool isLoading = false;
  bool isOnline = true;
  bool obscureText = true; // Add this variable for password visibility

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
  }

  Future<void> _checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      isOnline = connectivityResult != ConnectivityResult.none;
    });
  }

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
                    hintText: 'Enter your Email',
                  ),
                  validator: (val) {
                    // ... email validation logic ...
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
                    hintText: 'Enter Password',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  validator: (val) {
                    // ... password validation logic ...
                  },
                  obscureText: obscureText,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                isOnline
                    ? Text(
                        error,
                        style: TextStyle(color: Colors.red),
                      )
                    : Text(
                        'No internet connection',
                        style: TextStyle(color: Colors.red),
                      ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: isLoading || !isOnline
                      ? null
                      : () async {
                          if (_formKey.currentState?.validate() == true) {
                            setState(() {
                              isLoading = true;
                            });

                            dynamic result =
                                await _auth.signInWithEmail(email, password);

                            setState(() {
                              isLoading = false;
                            });

                            if (result == null) {
                              setState(() {
                                error = 'Wrong Credentials';
                              });
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            }
                          }
                        },
                  child: isLoading
                      ? CircularProgressIndicator()
                      : Text('Sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: Login()));
}
