import 'package:flutter/material.dart';
import 'package:flutter_app_testing/backend/controller/user/user_controller.dart';
import 'package:flutter_app_testing/backend/model/User/User.dart';

import 'package:flutter_app_testing/screens/components/search/searchbar.dart';
import 'package:flutter_app_testing/utils/Constant.dart';
import 'package:flutter_app_testing/widgets/box_that_go_all_right.dart';

class TopHomeBar extends StatelessWidget {
  const TopHomeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemiMentok();
  }
}

class DemiMentok extends StatelessWidget {
  const DemiMentok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: const TheActualContent(),
        )
      ],
    );
  }
}

class TheActualContent extends StatelessWidget {
  const TheActualContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: UserController.getUserUid(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final user = snapshot.data;
            if (user != null) {
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
                      'Hi, ${user.name ?? 'there'}!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomSearchBar()
                  ],
                ),
              );
            } else {
              // If user data is null, display a message
              return Text('User data not found');
            }
          }
        }
      },
    );
  }
}
