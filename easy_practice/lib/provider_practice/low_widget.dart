import 'package:easy_practice/provider_practice/fish_c.dart';
import 'package:flutter/material.dart';

class LowWidget extends StatelessWidget {
  const LowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Sp Low',
        ),
        SizedBox(
          height: 20,
        ),
        FishC()
      ],
    );
  }
}
