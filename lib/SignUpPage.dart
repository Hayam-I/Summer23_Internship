import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_nav/CommonElements/genTextFormField.dart';
import 'package:simple_nav/DatabaseHelper.dart';
import 'package:simple_nav/LoginPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();

  signUp() async {
    String username = usernameController.text;
    String phoneNumber = phoneNumberController.text;
    String password = passwordController.text;

    if (username.isEmpty || phoneNumber.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Please Enter All Fields',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }

    // Check if the entered username already exists in the database
    List<Map<String, dynamic>> rows =
        await DatabaseHelper.instance.queryAllRows();
    for (Map<String, dynamic> row in rows) {
      if (row[DatabaseHelper.columnUserName] == username) {
        Fluttertoast.showToast(
            msg: 'Username already exists. Please choose another one.',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        return;
      }
    }

    // Create a map of user data to be inserted into the database
    Map<String, dynamic> rowData = {
      DatabaseHelper.columnUserName: username,
      DatabaseHelper.columnPhone: phoneNumber,
      DatabaseHelper.columnPassword: password,
    };

    // Insert the user data into the database
    /* int id = await DatabaseHelper.instance.insert(rowData); */

    // Show a toast message to indicate that the user was added to the database
    Fluttertoast.showToast(
        msg: 'Account Successfully Created!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);

    // Query all rows of data from the database and print the result to the console
    rows = await DatabaseHelper.instance.queryAllRows();
    print(rows);
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
                  'Sign Up',
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
                    controller: usernameController,
                    hintName: 'Username',
                    iconData: Icons.person,
                    isObscureText: false,
                  ),
                ),

                //phone number
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  margin: const EdgeInsets.only(top: 10.0),
                  child: GenTextFormField(
                    controller: phoneNumberController,
                    hintName: 'Phone Number',
                    iconData: Icons.phone,
                    isObscureText: false,
                  ),
                ),

                //password
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  margin: const EdgeInsets.only(top: 10.0),
                  child: GenTextFormField(
                    controller: passwordController,
                    hintName: 'Password',
                    iconData: Icons.lock,
                    isObscureText: true,
                  ),
                ),

                //Sign Up BUTTON
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  margin: const EdgeInsets.only(top: 10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      signUp();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('Sign Up'),
                  ),
                ),

                //LOG IN ROW
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  margin: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
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
                                builder: (context) => const LoginPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                        ),
                        child: const Text('Log in'),
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
