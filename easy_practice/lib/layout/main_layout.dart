import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final String title;
  final Widget children;
  const MainLayout({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: children,
    );
  }
}
