import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controlls/controller.dart';
import 'package:getx_practice/screens/person_screen.dart';
import 'package:getx_practice/screens/simple_count.dart';

class HomeScreen extends StatelessWidget {
  // final Controller controller = Get.put(Controller());

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Get X',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: PersonScreen(),
      // body: const SafeArea(child: SimpleCount()),
    );
  }
}
