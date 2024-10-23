import 'package:easy_practice/screens/timer_practice.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            TextButton(
              onPressed: () => {},
              child: const Text('hi'),
            ),
            // const TimerPractice(),
          ],
        ),
      ),
    );
  }
}
