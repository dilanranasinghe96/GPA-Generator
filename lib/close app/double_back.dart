import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:gpa_generator/screens/home_page.dart';

class HomePageCloseApp extends StatelessWidget {
  const HomePageCloseApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(content: Text('Tap back again to leave')),
        child: HomePage(),
      ),
    ));
  }
}
