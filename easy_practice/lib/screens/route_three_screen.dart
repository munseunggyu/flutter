import 'package:easy_practice/layout/layout_practiec.dart';
import 'package:flutter/material.dart';

class RouteThreeScreen extends StatelessWidget {
  const RouteThreeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LayoutPractiec(
      title: 'RouteThreeScreen',
      children: [
        Text(
          'Three',
        ),
      ],
    );
  }
}
