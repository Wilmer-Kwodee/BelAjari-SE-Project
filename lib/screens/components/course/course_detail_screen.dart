import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'React JS Course',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwpsI9jSHNTUCKrouJHZZ4wH4HfbUipj-KqbdqrUVxsw&s'),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: const Text(
                'React from Zero to Hero 🚀',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(30),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Text('Stars: '),
                      Text('100'),
                      Expanded(child: SizedBox()),
                      Icon(Icons.star)
                    ],
                  ),
                  Row(
                    children: [
                      Text('Duration: '),
                      Text('300'),
                      Expanded(child: SizedBox()),
                      Icon(Icons.timer)
                    ],
                  ),
                  Row(
                    children: [
                      Text('Participants: '),
                      Text('13,456,453'),
                      Expanded(child: SizedBox()),
                      Icon(Icons.person)
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: const Text(
                  'React has become the de facto framework for building user interfaces in the React community. It has a record-breaking download count of 58.99 M.'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.orange,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  shape: CircleBorder(),
                  minimumSize: Size(56, 56), // specify the minimum size
                ),
                child: const Icon(Icons.star),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    minimumSize: Size(100, 56), // specify the minimum size
                  ),
                  child: const Text('Enroll Now'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
