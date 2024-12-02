import 'package:easy_practice/constant/color.dart';
import 'package:easy_practice/layout/main_layout.dart';
import 'package:flutter/material.dart';

class RefreshIndicatorScreen extends StatelessWidget {
  final List<int> numbers = List.generate(
    100,
    (index) => index,
  );

  RefreshIndicatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'RefreshIndicatorScreen',
      children: RefreshIndicator(
        onRefresh: () async {
          // 서버 요청
          await Future.delayed(const Duration(seconds: 3));
        },
        child: ListView(
          children: numbers
              .map(
                (e) => renderContainer(
                  color: rainbowColors[e % rainbowColors.length],
                  index: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    print(index);
    return Container(
      height: height ?? 300,
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
