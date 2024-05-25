import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

Color _generateRandomColor() {
  Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Flutter is Fun!'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return ListView.builder(
              itemBuilder: (_, index) {
                return Container(
                  color: _generateRandomColor(),
                  width: 500,
                  height: 500,
                  child: ElevatedButton(
                    child: Text('navigate - count: $count'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => AboutScreen()),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              count++;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Homeee',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'biznezz',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'skul',
            ),
          ],
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Text('This is the About Screen'),
      ),
    );
  }
}
