// import 'package:easy_practice/screens/daily.dart';
// import 'package:easy_practice/screens/timer_practice.dart';
// import 'package:easy_practice/screens/timer_practice.dart';
import 'package:easy_practice/buttonPractice/button_practice.dart';
import 'package:easy_practice/Navigators/navigation_pracitce.dart';
import 'package:easy_practice/vid_player/vid_player_screen.dart';
// import 'package:easy_practice/screens/random_num.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return const RandomNum();
    // return const ButtonsPracitce();
    // return const NavigationPractice();
    // const Scaffold(
    //   // body: TimerPractice(),
    //   // body: Daily(),
    //   body: RandomNum(),
    // );
    return const VidPlayerScreen();
  }
}
