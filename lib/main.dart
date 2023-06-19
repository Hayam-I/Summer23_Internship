import 'package:flutter/material.dart';
import 'package:simple_nav/DatabaseHelper.dart';
import 'package:simple_nav/LoginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the database
  await DatabaseHelper.instance.init();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Checklist Application',
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.green,
      ),
    ),
    home: const LoginPage(),
  ));
}
