import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({super.key,required this.text,required this.onPressed});
  
  //button widget
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text),
      color: const Color.fromARGB(255, 115, 84, 121),
      );  
  }
}