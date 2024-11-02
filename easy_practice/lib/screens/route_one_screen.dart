import 'package:easy_practice/layout/layout_practiec.dart';
import 'package:flutter/material.dart';

class RouteOneScreen extends StatelessWidget {
  const RouteOneScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LayoutPractiec(
      title: 'RouteOneScreen',
      children: [
        Text(
          'One',
        ),
      ],
    );
  }
}
