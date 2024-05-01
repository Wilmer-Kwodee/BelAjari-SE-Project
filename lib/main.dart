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
        title: const Text('Hello,'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              WilmerCourseButton(),
              WilmerCourseButton(),
              WilmerCourseButton(),
              WilmerCourseButton(),
            ],
          )),
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CourseScreen()),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        color: Colors.grey[200],
        child: const Text('Coding courses'),
      ),
    );
  }
}
