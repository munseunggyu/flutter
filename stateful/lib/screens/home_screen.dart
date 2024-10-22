import 'package:flutter/material.dart';
import 'package:stateful/screens/life_cycle.dart';

/// life lifecycle
/// - HomeScreen
/// 1. Constructor
/// 2. createState
///
/// - _HomeScreenState
/// 1. initState
/// 2. didChangeDependecies
/// 3. dirty
/// 4. build
/// 5. deactivate
/// 6. dispose
///

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  Color color = Colors.blue;
  bool show = true;

  void changeColor() {
    setState(() {
      if (color == Colors.blue) {
        color = Colors.black;
      } else {
        color = Colors.blue;
      }
    });
  }

  void changeShow() {
    setState(() {
      show = !show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          ElevatedButton(
            onPressed: changeColor,
            child: const Text('색상 변경'),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 50,
            height: 50,
            color: color,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: changeShow,
            child: const Text('show'),
          ),
          if (show)
            LifeCycle(
              color: color,
            )
        ]),
      ),
    );
  }
}
