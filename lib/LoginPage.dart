import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_nav/DatabaseHelper.dart';
import 'package:simple_nav/SignUpPage.dart';

import 'CommonElements/genTextFormField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController1 = TextEditingController();
  final passwordController1 = TextEditingController();

  login() async {
    String usernameID = usernameController1.text;
    String passwordID = passwordController1.text;

    if (usernameID.isEmpty || passwordID.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Please Enter All Fields',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    } else {
      // Query the database for the entered username and password
      List<Map<String, dynamic>> rows = await DatabaseHelper.instance
          .queryUserNameAndPassword(usernameID, passwordID);
      if (rows.isNotEmpty) {
        // Display a toast message indicating that the login was successful
        Fluttertoast.showToast(
            msg: 'Login Successful',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: 'Invalid username or password',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: const Text('Login Page'),
      ), */
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 24.0),

                //IMAGE
                Image.asset('images/logo.png',
                    width: 500, height: 150, fit: BoxFit.cover),

                const SizedBox(height: 25.0),

                //TEXT
                const Text(
                  'Login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 30.0),
                ),

                //USERNAME
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  margin: const EdgeInsets.only(top: 10.0),
                  child: GenTextFormField(
                    controller: usernameController1,
                    hintName: 'Username',
                    iconData: Icons.person,
                    isObscureText: false,
                  ),
                ),

                //PASSWORD
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  margin: const EdgeInsets.only(top: 10.0),
                  child: GenTextFormField(
                    controller: passwordController1,
                    hintName: 'Password',
                    iconData: Icons.password,
                    isObscureText: true,
                  ),
                ),

                //LOGIN BUTTON
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  margin: const EdgeInsets.only(top: 10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('Login'),
                  ),
                ),

                //SIGN UP ROW
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  margin: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.green,
                            fontSize: 15.0),
                      ),
                      const SizedBox(width: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                        ),
                        child: const Text('Sign up'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
