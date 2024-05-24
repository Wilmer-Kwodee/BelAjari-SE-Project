import 'package:flutter/material.dart';

class HomeCourses extends StatelessWidget {
  const HomeCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Courses',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Spacer(),
              Text('See All')
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CourseCard(icon: Icon(Icons.double_arrow), name: 'Flutter'),
              SizedBox(
                width: 20,
              ),
              CourseCard(icon: Icon(Icons.ac_unit), name: 'React Native'),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CourseCard(
                  icon: Icon(Icons.wifi_tethering_error_rounded_sharp),
                  name: 'Python'),
              SizedBox(
                width: 20,
              ),
              CourseCard(icon: Icon(Icons.auto_awesome_mosaic), name: 'C++'),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CourseCard(icon: Icon(Icons.double_arrow), name: 'Flutter'),
              SizedBox(
                width: 20,
              ),
              CourseCard(icon: Icon(Icons.ac_unit), name: 'React Native'),
            ],
          ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final Icon icon;
  final String name;
  const CourseCard({super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 20),
          ),
          Text('0 videos'),
        ],
      ),
      width: 150,
      height: 150,
    );
  }
}
