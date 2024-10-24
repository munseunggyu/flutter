import 'package:easy_practice/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'sunflower',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 80,
            fontFamily: 'parisienne',
          ),
        ),
      ),
      home: const HomeScreen(),
    ),
  );
}
