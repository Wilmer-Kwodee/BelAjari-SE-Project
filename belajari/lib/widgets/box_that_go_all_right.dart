import 'package:flutter/material.dart';
import 'package:flutter_app_testing/utils/Constant.dart';

class BoxThatGoAllToRight extends StatelessWidget {
  final String theParameter;
  const BoxThatGoAllToRight({super.key, required this.theParameter});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                color: Constant.GreySecondary),
            width: 300,
            child: Text(theParameter),
          ),
        ),
      ],
    );
  }
}