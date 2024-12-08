import 'package:easy_practice/provider_practice/fish_b.dart';
import 'package:flutter/material.dart';

class MiddleWidget extends StatelessWidget {
  const MiddleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'B Middle',
        ),
        SizedBox(
          height: 20,
        ),
        FishB()
      ],
    );
  }
}
