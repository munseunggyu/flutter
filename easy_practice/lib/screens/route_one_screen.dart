import 'package:easy_practice/layout/layout_practiec.dart';
import 'package:easy_practice/screens/route_two_screen.dart';
import 'package:flutter/material.dart';

class RouteOneScreen extends StatelessWidget {
  final int number;
  const RouteOneScreen({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // 시스템 뒤로가기 막기
      canPop: false,
      child: LayoutPractiec(
        title: 'RouteOneScreen',
        children: [
          Text(
            'One $number',
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(456);
            },
            child: const Text(
              'pop',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).maybePop(456);
            },
            child: const Text(
              'Maybe pop',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const RouteTwoScreen();
                  },
                  settings: const RouteSettings(
                    arguments: 23,
                  ),
                ),
              );
            },
            child: const Text(
              'push',
            ),
          ),
        ],
      ),
    );
  }
}
