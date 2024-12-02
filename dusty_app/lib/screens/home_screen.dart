import 'package:dusty_app/component/main_stat.dart';
import 'package:dusty_app/const/color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(children: [
          MainStat(),
        ]),
      ),
    );
  }
}
