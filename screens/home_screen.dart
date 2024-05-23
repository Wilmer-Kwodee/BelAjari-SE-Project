import 'package:flutter/material.dart';
import 'package:flutter_app_testing/screens/home_courses_section.dart';
import 'package:flutter_app_testing/screens/home_menus.dart';
import 'package:flutter_app_testing/screens/top_home_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHomeBar(),
            HomeMenus(),
            HomeCourses(),
          ],
        ),
      ),
    );
  }
}
