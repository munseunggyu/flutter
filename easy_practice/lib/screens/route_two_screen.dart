import 'package:easy_practice/layout/layout_practiec.dart';
import 'package:flutter/material.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LayoutPractiec(
      title: 'RouteTwoScreen',
      children: [
        Text(
          'Two',
        ),
      ],
    );
  }
}
