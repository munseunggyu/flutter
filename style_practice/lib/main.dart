import 'package:flutter/material.dart';
import 'package:style_practice/widgets/contentsComponent.dart';
import 'package:style_practice/widgets/homeScreen.dart';

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF335CB0),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: HomeScreen(),
        ),
      ),
    );
  }
}
