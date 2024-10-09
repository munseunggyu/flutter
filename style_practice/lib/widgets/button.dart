import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color txtColor;

  const MyButton(
      {super.key,
      required this.text,
      required this.bgColor,
      required this.txtColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w500, color: txtColor),
        ),
      ),
    );
  }
}
