import 'package:flutter/material.dart';
import 'package:flutter_app_testing/backend/controller/user/tutor_controller.dart';
import 'package:flutter_app_testing/backend/controller/user/user_controller.dart';
import 'package:flutter_app_testing/backend/model/user/User.dart';
import 'package:flutter_app_testing/backend/model/user/parent.dart';
import 'package:flutter_app_testing/backend/model/user/tutor.dart';
import 'package:flutter_app_testing/backend/repository/user/parent_repository.dart';
import 'package:flutter_app_testing/backend/repository/user/tutor_repository.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key});

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<User?>(
        future: UserController.getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final user = snapshot.data;
            return FutureBuilder<dynamic>(
              future: _getObject(user),
              builder: (context, objectSnapshot) {
                if (objectSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (objectSnapshot.hasError) {
                  return Center(child: Text('Error: ${objectSnapshot.error}'));
                } else {
                  final object = objectSnapshot.data;
                  return _buildProfileScreen(user, object, context);
                }
              },
            );
          }
        },
      ),
    );
  }

    Future<dynamic> _getObject(User? user) async { 
    if (user != null && user.role == "tutor") {
      return await TutorRepository.getTutorByUserId(user.userId);
    } else if (user != null && user.role == "parent") {
      return await ParentRepository.getParentByUserId(user.userId);
    } else {
      return null;
    }
  }


  Widget _buildProfileScreen(User? user, dynamic roleObject, BuildContext context) {
    String phoneNumber = "";
    print(roleObject);

    if (roleObject != null && roleObject is Tutor){
      phoneNumber = roleObject.phoneNumber;
    }
    else if (roleObject != null && roleObject is Parent){
      phoneNumber = roleObject.phoneNumber;
    }

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Settings',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              // Icon(Icons.face, color: Colors.red[900]),
              Image.asset(
                'assets/profile-circle-icon.png',
                width: 80,
                height: 80,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user?.name ?? "null",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    phoneNumber,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              // Handle tap
            },
            leading: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purpleAccent,
              ),
              child: Icon(
                Icons.nightlight_round,
                color: Colors.purple,
              ),
              width: 40,
              height: 40,
            ),
            title: Text('Dark Mode'),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'GENERAL',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ListTile(
            onTap: () {
              // Handle tap
            },
            leading: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.greenAccent,
              ),
              child: Icon(
                Icons.person,
                color: Colors.green,
              ),
              width: 40,
              height: 40,
            ),
            title: Text('Account Settings'),
            trailing: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(Icons.arrow_forward),
            ),
          ),
          ListTile(
            onTap: () {
              // Handle tap
            },
            leading: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orangeAccent,
              ),
              child: Icon(
                Icons.notifications,
                color: Colors.orange[900],
              ),
              width: 40,
              height: 40,
            ),
            title: Text('Notifications'),
          ),
          ListTile(
            onTap: () {
              UserController.logout(context);
            },
            leading: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent,
              ),
              child: Icon(
                Icons.logout,
                color: Colors.blue[900],
              ),
              width: 40,
              height: 40,
            ),
            title: Text('Logout'),
          ),
          ListTile(
            onTap: () {
              // Handle tap
            },
            leading: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.pinkAccent,
              ),
              child: Icon(
                Icons.restore_from_trash_rounded,
                color: Colors.pink,
              ),
              width: 40,
              height: 40,
            ),
            title: Text('Delete Account'),
            trailing: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(Icons.arrow_forward),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'FEEDBACK',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ListTile(
            onTap: () {
              // Handle tap
            },
            leading: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.limeAccent,
              ),
              child: Icon(
                Icons.bug_report,
                color: Colors.lime[900],
              ),
              width: 40,
              height: 40,
            ),
            title: Text('Report a bug'),
          ),
        ],
      ),
    );
  }
}
