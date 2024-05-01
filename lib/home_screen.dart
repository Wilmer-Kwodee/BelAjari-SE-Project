import 'package:flutter/material.dart';
import 'course_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.orange.shade300,
          ], // Define your gradient colors here
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors
            .transparent, // Set the background color of the Scaffold to transparent
        appBar: AppBar(
          title: const Text(
            'Explore Categories',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
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
          ),
        ),
      ),
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
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(10), // Adjust the radius as needed
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Shadow color
                spreadRadius: 5, // Spread radius
                blurRadius: 7, // Blur radius
                offset: Offset(0, 3), // Offset
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Coding courses',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('864 courses'),
              SizedBox(
                height: 5,
              ),
              Image.network(
                  'https://www.codingdojo.com/blog/wp-content/uploads/react.jpg'),
            ],
          )),
    );
  }
}
