import 'package:flutter/material.dart';

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
                color: Colors.grey[200]),
            width: 300,
            child: Text(theParameter),
          ),
        ),
      ],
    );
  }
}