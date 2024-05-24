import 'package:flutter/material.dart';
import 'package:flutter_app_testing/screens/landing_page_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LandingPage1(),
      ),
    );
  }
}
