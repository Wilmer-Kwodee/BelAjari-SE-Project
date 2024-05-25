import 'package:flutter/material.dart';

class HomeMenus extends StatelessWidget {
  const HomeMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MenuItems(
                icon: Icon(
                  Icons.category,
                  color: Colors.white,
                ),
                color: Colors.yellow.shade700,
                name: 'Category',
              ),
              Spacer(),
              MenuItems(
                icon: Icon(
                  Icons.video_collection,
                  color: Colors.white,
                ),
                color: Colors.cyan,
                name: 'Classes',
              ),
              Spacer(),
              MenuItems(
                icon: Icon(
                  Icons.free_breakfast_rounded,
                  color: Colors.white,
                ),
                color: Colors.blue,
                name: 'Free Courses',
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MenuItems(
                icon: Icon(
                  Icons.video_collection,
                  color: Colors.white,
                ),
                color: const Color.fromARGB(255, 239, 83, 80),
                name: 'BookStore',
              ),
              Spacer(),
              MenuItems(
                icon: Icon(
                  Icons.live_tv,
                  color: Colors.white,
                ),
                color: Colors.purple,
                name: 'Live Courses',
              ),
              Spacer(),
              MenuItems(
                icon: Icon(
                  Icons.leaderboard_rounded,
                  color: Colors.white,
                ),
                color: Colors.green,
                name: 'LeaderBoard',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MenuItems extends StatelessWidget {
  final Icon icon;
  final Color color;
  final String name;
  const MenuItems(
      {super.key, required this.icon, required this.color, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          child: icon,
        ),
        Text(name)
      ],
    );
  }
}
