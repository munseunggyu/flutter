import 'package:flutter/material.dart';

class LayoutContainer extends StatelessWidget {
  final String title;
  final Widget children;
  final Widget? bottom;
  const LayoutContainer(
      {super.key, required this.children, required this.title, this.bottom});

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
          child: children,
        ),
      ),
      bottomNavigationBar: bottom,
    );
  }
}
