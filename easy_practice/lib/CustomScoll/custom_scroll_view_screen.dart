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
          backgroundColor: Colors.blue,
          title: Text(
            'Title',
            style: TextStyle(color: Colors.white),
          ),
          floating: true, // 위로 스크롤 시 노출됨
          // pinned: true, // 상단 고정 됨
          snap: true, // 살짝만 움직여도 floating이 동작됨 floating true 필수
          stretch: true, // Appbar가 따라옴
          // expandedHeight: 200, // 최대 높이값
          collapsedHeight: 100, // 최소 높이값
          flexibleSpace: FlexibleSpaceBar(
            title: Text('data'), // 하단 widget 추가
          ),
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
