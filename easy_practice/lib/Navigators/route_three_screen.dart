import 'package:easy_practice/layout/layout_practiec.dart';
import 'package:flutter/material.dart';

class RouteThreeScreen extends StatelessWidget {
  const RouteThreeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments;
    return LayoutPractiec(
      title: 'RouteThreeScreen',
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'pop $arg',
          ),
        )
      ],
    );
  }
}
