import 'package:flutter/material.dart';

class LayoutContainer extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const LayoutContainer(
      {super.key, required this.children, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
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
