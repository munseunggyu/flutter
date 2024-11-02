import 'package:flutter/material.dart';

class LayoutPractiec extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const LayoutPractiec(
      {super.key, required this.children, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }
}
