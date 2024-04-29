import 'package:flutter/material.dart';

import 'detail_screen.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coding Category'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: ListView(
          children: [CourseTopicButton(), CourseTopicButton()],
        ),
      ),
    );
  }
}

class CourseTopicButton extends StatelessWidget {
  const CourseTopicButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen()),
        );
      },
      child: Text('React JS'),
    );
  }
}
