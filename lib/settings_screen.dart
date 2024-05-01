import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Divider(),
            SizedBox(
              height: 20,
            ),
            Text('Settings Screen >'),
            SizedBox(
              height: 20,
            ),
            Text('Dark theme >'),
            SizedBox(
              height: 20,
            ),
            Text('Account & Privacy >'),
            SizedBox(
              height: 20,
            ),
            Text('Log Out >'),
          ],
        ),
      ),
    );
  }
}
