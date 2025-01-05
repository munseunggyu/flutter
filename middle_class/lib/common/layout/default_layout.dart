import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;

  const DefaultLayout(
      {super.key,
      required this.child,
      this.backgroundColor = Colors.white,
      this.title,
      this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: child,
      backgroundColor: backgroundColor,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  AppBar? renderAppBar() {
    if (title == null) return null;
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0, // 앞으로 튀어나와보이는 스타일
      title: Text(
        title!,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      foregroundColor: Colors.black,
    );
  }
}
