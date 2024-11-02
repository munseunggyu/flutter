import 'package:easy_practice/layout/layout_practiec.dart';
import 'package:easy_practice/screens/route_one_screen.dart';
import 'package:flutter/material.dart';

class NavigationPractice extends StatelessWidget {
  const NavigationPractice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutPractiec(
      title: 'main home',
      children: [
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const RouteOneScreen();
                },
              ),
            );
          },
          child: const Text(
            'push',
          ),
        ),
      ],
    );
  }
}
