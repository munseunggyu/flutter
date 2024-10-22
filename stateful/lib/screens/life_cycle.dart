import 'package:flutter/material.dart';

class LifeCycle extends StatefulWidget {
  final Color color;
  LifeCycle({super.key, required this.color}) {
    print('1) stateful Widget Constructor');
  }

  @override
  State<LifeCycle> createState() {
    print('2) stateful Widget Create State');

    return _LifeCycleState();
  }
}

class _LifeCycleState extends State<LifeCycle> {
  @override
  void initState() {
    print('3) Statefule Widget initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('4) didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('5) build');

    return Container(
      width: 50,
      height: 50,
      color: widget.color,
    );
  }

  @override
  void deactivate() {
    print('6) deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('7) dispose');
    super.dispose();
  }
}
