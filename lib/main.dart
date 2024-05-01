import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'mylearning_screen.dart';
import 'settings_screen.dart';
import 'wishlist_screen.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    MyLearningScreen(),
    WishlistScreen(),
    SettingsScreen(),
  ];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // Icon(Icons.waving_hand),
            Text('👋'),
            SizedBox(width: 20), // Add spacing between the elements
            Text('Hello, William!'),
          ],
        ),
        // backgroundColor: Colors.orange,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange.shade300,
        fixedColor: Colors.white,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'my learning'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'wishlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'settings'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
