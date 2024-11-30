import 'package:easy_practice/constant/color.dart';
import 'package:easy_practice/layout/main_layout.dart';
import 'package:flutter/material.dart';

class GridViewPractice extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  GridViewPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(title: 'Grid View', children: gridTest());
  }

  Widget gridTest() {
    return GridView.builder(
        // 가로 최대 사이즈
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200),
        itemBuilder: (context, index) {
          return renderContainer(
              color: rainbowColors[index % rainbowColors.length], index: index);
        });
  }

// 보이는 것만 빌드
  Widget gridBuilder() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return renderContainer(
              color: rainbowColors[index % rainbowColors.length], index: index);
        });
  }

// 한 번에 그림
  Widget simpleGrid() {
    return GridView.count(
      crossAxisSpacing: 12,
      mainAxisSpacing: 8,
      crossAxisCount: 2,
      children: numbers
          .map((e) =>
              renderContainer(color: rainbowColors[e % rainbowColors.length]))
          .toList(),
    );
  }

  Widget renderContainer({required Color color, int? index}) {
    print(index);
    return Container(
      height: 300,
      color: color,
    );
  }
}
