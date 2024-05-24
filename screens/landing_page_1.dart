import 'package:flutter/material.dart';
import 'package:flutter_app_testing/screens/landing_page_2.dart';
import 'package:flutter_app_testing/utils/Constant.dart';

class LandingPage1 extends StatelessWidget {
  const LandingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Icon(
              Icons.menu_book_rounded,
              color: Constant.HeroColor,
              size: 100,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              color: Constant.GreySecondary,
            ),
            width: 200,
            height: 200,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Welcome to BelAjari!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text('all your learning needs, in a single app.'),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Constant.HeroColor,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LandingPage2()));
              },
              child: Text(
                'Next',
                style: TextStyle(color: Constant.SecondaryWhite),
              )),
        ],
      ),
    );
  }
}
