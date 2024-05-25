import 'package:flutter/material.dart';
import 'package:flutter_app_testing/screens/home_courses_section.dart';
import 'package:flutter_app_testing/screens/home_menus.dart';
import 'package:flutter_app_testing/screens/message_screen.dart';
import 'package:flutter_app_testing/screens/profile_screen.dart';
import 'package:flutter_app_testing/screens/top_home_bar.dart';
import 'package:flutter_app_testing/utils/Constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        TheHome(),
        Container(
          child: MessageScreen(),
        ),
        Container(
          child: ProfileScreen(),
        ),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.orange.shade200,
        indicatorColor: Constant.SecondaryWhite,
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.messenger_sharp),
            label: 'Messages',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'My Profile',
          ),
        ],
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
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
