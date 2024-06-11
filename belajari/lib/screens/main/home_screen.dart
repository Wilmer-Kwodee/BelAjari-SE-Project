import 'package:flutter/material.dart';
import 'package:flutter_app_testing/screens/components/home/home_courses_section.dart';
import 'package:flutter_app_testing/screens/components/home/home_menus.dart';
import 'package:flutter_app_testing/screens/components/chat/message_screen.dart';
import 'package:flutter_app_testing/screens/components/profile/profile_screen.dart';
import 'package:flutter_app_testing/screens/components/home/top_home_bar.dart';
import 'package:flutter_app_testing/utils/Constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        children: <Widget>[
          TheHome(),
          Container(
            child: MessageScreen(),
          ),
          Container(
            child: ProfileScreen(),
          ),
        ],
      ),
      bottomNavigationBar:  BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        selectedItemColor: Color.fromARGB(255, 255, 156, 7),
        unselectedItemColor: Color.fromARGB(255, 161, 161, 161),
        selectedFontSize: 14,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        items: [
           BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.messenger_outline),
            activeIcon: Icon(Icons.messenger),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'My Profile',
          ),
        ],
        currentIndex: currentPageIndex,
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
      ),
    );
  }
}

class TheHome extends StatelessWidget {
  const TheHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TopHomeBar(),
          HomeMenus(),
          HomeCourses(),
        ],
      ),
    );
  }
}
