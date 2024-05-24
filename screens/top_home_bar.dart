import 'package:flutter/material.dart';
import 'package:flutter_app_testing/utils/Constant.dart';
import 'package:flutter_app_testing/widgets/box_that_go_all_right.dart';

class TopHomeBar extends StatelessWidget {
  const TopHomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DemiMentok();
  }
}

class DemiMentok extends StatelessWidget {
  const DemiMentok({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TheActualContent(),
        )
      ],
    );
  }
}

class TheActualContent extends StatelessWidget {
  const TheActualContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Constant.HeroColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.library_books,
                  color: Colors.white,
                ),
                Spacer(),
                Icon(
                  Icons.notifications_active,
                  color: Colors.white,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Hi, Wilmer!',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            BoxThatGoAllToRight(theParameter: 'Search here...'),
          ],
        ));
  }
}
