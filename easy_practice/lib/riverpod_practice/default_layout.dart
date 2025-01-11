import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;

  const DefaultLayout(
      {super.key, this.actions, required this.body, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: body,
      ),
    );
  }
}
