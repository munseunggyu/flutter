import 'package:easy_practice/constant/color.dart';
import 'package:flutter/material.dart';

class CustomScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  CustomScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text('Title'),
        ),
        SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return renderContainer(
                  color: rainbowColors[index % rainbowColors.length],
                  index: index);
            }),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150))
      ],
    ));
  }

  SliverGrid renderSliverGridBuilder() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return renderContainer(
            color: rainbowColors[index % rainbowColors.length], index: index);
      }),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150),
    );
  }

  // 바로 랜더링 함
  SliverGrid renderSliverGrid() {
    return SliverGrid(
        delegate: SliverChildListDelegate(
          numbers
              .map(
                (e) => renderContainer(
                    color: rainbowColors[e % rainbowColors.length], index: e),
              )
              .toList(),
        ),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2));
  }

// 보여지면 랜더링 함
  SliverList renderSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return renderContainer(
            color: rainbowColors[index % rainbowColors.length], index: index);
      }, childCount: 100),
    );
  }

// 한 번에 보여줌
  SliverList renderChildSliverList() {
    return SliverList(
        delegate: SliverChildListDelegate(
      numbers
          .map(
            (e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length], index: e),
          )
          .toList(),
    ));
  }

  Widget renderContainer({required Color color, int? index}) {
    print(index);
    return Container(
      height: 300,
      color: color,
      child: Text(
        index.toString(),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
