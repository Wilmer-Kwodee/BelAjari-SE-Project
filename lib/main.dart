import 'package:flutter/material.dart';
import 'course_screen.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello,'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: ListView(
          children: [
            WilmerCourseButton(),
            WilmerCourseButton(),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [],
      // ),
    );
  }
}

class WilmerCourseButton extends StatelessWidget {
  const WilmerCourseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CourseScreen()),
        );
      },
      child: Text('Coding courses'),
    );
  }
}
