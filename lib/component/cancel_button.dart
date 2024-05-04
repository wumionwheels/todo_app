// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';


class CancelButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  CancelButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      
      elevation: 0,
      color: Color.fromARGB(255, 206, 211, 215),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black
        ),
      ),
    );
  }
}