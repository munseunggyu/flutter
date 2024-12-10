import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controlls/controller.dart';

class HomeScreen extends StatelessWidget {
  Controller controller = Get.put(Controller());
  HomeScreen({super.key});

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
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Add number',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
