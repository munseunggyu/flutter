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
          onPressed: () async {
            final result = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const RouteOneScreen(number: 20);
                },
              ),
            );
            print(result);
          },
          child: const Text(
            'push',
          ),
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
            print(Navigator.of(context).canPop());
          },
          child: const Text(
            'can pop',
          ),
        ),
      ],
    );
  }
}
