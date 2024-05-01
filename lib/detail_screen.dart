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
              color: Colors.brown[200],
              padding: const EdgeInsets.all(30),
              child: const Text('how i like my cofee...'),
            ),
            Container(
              color: Colors.red[200],
              padding: const EdgeInsets.all(30),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Text('data: '),
                      Text('100'),
                      Expanded(child: SizedBox()),
                      Icon(Icons.favorite)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('sugar: '),
                      Text('300'),
                      Expanded(child: SizedBox()),
                      Icon(Icons.account_balance)
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: Colors.yellow[200],
              padding: const EdgeInsets.all(30),
              child: const Text('how i like my cofee...'),
            ),
            Container(
              color: Colors.blue[200],
              padding: const EdgeInsets.all(30),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Icon(Icons.favorite),
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
