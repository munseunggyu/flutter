import 'package:easy_practice/provider_practice/fish_a.dart';
import 'package:flutter/material.dart';

class FishHigh extends StatelessWidget {
  const FishHigh({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Fish High',
        ),
        SizedBox(
          height: 20,
        ),
        FishA()
      ],
    );
  }
}
