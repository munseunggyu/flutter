import 'package:easy_practice/constant/color.dart';
import 'package:easy_practice/layout/main_layout.dart';
import 'package:flutter/material.dart';

class ListViewPractice extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  ListViewPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'List View',
        children: ListView.separated(
          // 보이는 것만 그리고 중간 widget 추가 가능
          itemBuilder: (context, index) {
            return renderContainer(
              index: index,
              color: rainbowColors[index % rainbowColors.length],
            );
          },
          itemCount: 100,
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 20,
            );
          },
        ));
  }

// 보이는 것만 그린다.
  Widget listViewBuilder() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return renderContainer(
          index: index,
          color: rainbowColors[index % rainbowColors.length],
        );
      },
      itemCount: 100,
    );
  }

// 한 번에 그린다.
  Widget simpleListView() {
    return ListView(
      children: numbers
          .map(
            (e) => renderContainer(
              index: e,
              color: rainbowColors[e % rainbowColors.length],
            ),
          )
          .toList(),
    );
  }

  Widget renderContainer({required Color color, required int index}) {
    print(index);
    return Container(
      height: 300,
      color: color,
      child: Text('$index'),
    );
  }
}
