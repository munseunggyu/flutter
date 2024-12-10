import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controlls/controller.dart';

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
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<Controller>(
                builder: (controller) {
                  // return Text('Current value is ${controller.x}');
                  return Text('current ${Get.find<Controller>().x}');
                },
                init: Controller(),
              ),
              ElevatedButton(
                onPressed: () {
                  // controller.increment();
                  Get.find<Controller>().increment();
                },
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
