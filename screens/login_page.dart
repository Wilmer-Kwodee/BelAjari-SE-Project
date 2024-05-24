import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_testing/screens/home_screen.dart';
import 'package:flutter_app_testing/widgets/box_that_go_all_right.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Content(),
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Log In',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(
            height: 40,
          ),
          Text('Your Email'),
          BoxThatGoAllToRight(
            theParameter: 'enter email here...',
          ),
          SizedBox(
            height: 10,
          ),
          Text('Password'),
          BoxThatGoAllToRight(
            theParameter: '*****',
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forget password?',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ButtonThatGoAllToRight(
              theParameter: 'Log In', parameter2: HomeScreen()),
          Center(child: Text('dont have an account? Sign up')),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}

class ButtonThatGoAllToRight extends StatelessWidget {
  final String theParameter;
  final Widget parameter2;
  const ButtonThatGoAllToRight(
      {super.key, required this.theParameter, required this.parameter2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => parameter2));
            },
            child: Text(theParameter),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
      ],
    );
  }
}
