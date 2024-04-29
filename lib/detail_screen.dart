import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('React JS Course'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text('react from 0 to 100'),
            SizedBox(
              height: 30,
            ),
            Text('some videooo'),
            SizedBox(
              height: 30,
            ),
            Text('buttons & description'),
            SizedBox(
              height: 30,
            ),
            Text('bro help no idea how do this 🗿🗿🗿'),
            Divider(
              height: 60,
              color: Colors.orange,
            ),
            Row(
              children: <Widget>[
                Icon(Icons.favorite),
                SizedBox(
                  width: 20,
                ),
                Text('test blabla'),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Text('this is Enroll Course button'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
