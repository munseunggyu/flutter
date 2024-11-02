import 'package:easy_practice/layout/layout_practiec.dart';
import 'package:easy_practice/Navigators/route_three_screen.dart';
import 'package:flutter/material.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments;
    return LayoutPractiec(
      title: 'RouteTwoScreen',
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'pop $arg',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/three',
              arguments: 333,
            );
          },
          child: Text(
            'push $arg',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
              '/three',
              arguments: 333,
            );
          },
          child: const Text(
            'replace',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/three',
              (route) {
                // Route stack에서 삭제 여부에 따라 false는 삭제, 안할거면 true
                return route.settings.name == '/';
              },
              arguments: 333,
            );
          },
          child: const Text(
            'push named and remove until',
          ),
        ),
      ],
    );
  }
}
