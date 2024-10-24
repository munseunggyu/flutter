import 'package:easy_practice/screens/daily.dart';
// import 'package:easy_practice/screens/timer_practice.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Daily(),
    );
  }
}
