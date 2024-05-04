// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';


class PrimaryButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      color: Colors.blue,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white
        ),
      ),
    );
  }
}