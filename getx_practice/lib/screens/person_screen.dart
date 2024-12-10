import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controlls/person_controller.dart';

class PersonScreen extends StatelessWidget {
  final PersonController personController = Get.put(PersonController());

  PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<PersonController>(
            builder: (controller) {
              return Text('Current value is ${personController.person().name}');
            },
          ),
          GetBuilder<PersonController>(
            builder: (controller) {
              return Text('Current value is ${personController.person().age}');
            },
          ),
          Obx(() => Text('Current value is ${personController.person().age}')),
          ElevatedButton(
            onPressed: () {
              personController.updateInfo();
            },
            child: const Text(
              'change info',
            ),
          )
        ],
      ),
    );
  }
}
