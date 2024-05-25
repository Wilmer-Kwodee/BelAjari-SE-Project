import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     'My Learning',
        //     style: TextStyle(fontWeight: FontWeight.bold),
        //   ),
        // ),
        body: Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Messages',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Your Chats',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ListTile(
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
            title: Text('Andy'),
          ),
          ListTile(
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
            title: Text('Budy'),
          ),
          ListTile(
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
            title: Text('Caddy'),
          ),
          ListTile(
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
            title: Text('Daddy'),
          ),
        ],
      ),
    ));
  }
}
