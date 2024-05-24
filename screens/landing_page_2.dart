import 'package:flutter/material.dart';
import 'package:flutter_app_testing/screens/login_page.dart';

class LandingPage2 extends StatelessWidget {
  const LandingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LandingPage2Content(),
    );
  }
}

class LandingPage2Content extends StatelessWidget {
  const LandingPage2Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Icon(
              Icons.tag_faces_sharp,
              color: Colors.orange,
              size: 100,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 230, 230, 230),
            ),
            width: 200,
            height: 200,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Quick and Easy\n Learning',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            textAlign: TextAlign.center,
          ),
          Text(
            'fast and easy learning at any time, \n helps improve various skills',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text('Start Learning!'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          ),
        ],
      ),
    );
  }
}
