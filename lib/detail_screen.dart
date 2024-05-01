import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              // color: Colors.grey[200],
              padding: const EdgeInsets.all(30),
              child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwpsI9jSHNTUCKrouJHZZ4wH4HfbUipj-KqbdqrUVxsw&s'),
            ),
            Container(
                // color: Colors.orange,
                padding: const EdgeInsets.all(30),
                child: const Text(
                  'React from Zero to Hero 🚀',
                  style: TextStyle(
                    fontSize: 24, // Adjust the font size as needed
                    fontWeight: FontWeight.bold, // Bold font weight
                    // You can also set other properties like color, font family, etc. here
                  ),
                )),
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
              // color: Colors.yellow[200],
              padding: const EdgeInsets.all(30),
              child: const Text(
                  'React has become the de facto framework for building user interfaces in the React community. It has a record-breaking download count of 58.99 M.'),
            ),
            Container(
              color: Colors.orange,
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Icon(Icons.star),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Enroll Now'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
