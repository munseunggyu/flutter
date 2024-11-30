import 'package:easy_practice/constant/color.dart';
import 'package:flutter/material.dart';

class SingleChildScroll extends StatelessWidget {
  const SingleChildScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SimpleScollViewScreen(),
      // body: const Placeholder(),
    );
  }
}

class SimpleScollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  SimpleScollViewScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // 높이가 화면을 넘어가게 되면 그 이후부터 스크롤 생김
    // 화면에 바로 렌더링함 lazy loading을 하지 않음
    return SingleChildScrollView(
      // physics: const ClampingScrollPhysics(), // 안드로이드 스타일 튕김이 안됨
      // physics: const BouncingScrollPhysics(), // 안드로이드에서도 상단 스크롤 튕김 가능 IOS 스타일처럼 됨
      // physics: const AlwaysScrollableScrollPhysics(), // 항상 스크롤 가능
      // physics: NeverScrollableScrollPhysics(), // 스크롤 안되게 막기
      // clipBehavior: Clip.none, // 스크롤을 해도 위젯이 잘리지 않도록 설정
      child: Column(
        // children: rainbowColors.map((e) {
        //   return renderContainer(color: e);
        // }).toList(),
        // children: [
        //   rainbowColors.map((e) {
        //     return renderContainer(color: e);
        //   }).toList()[0]
        // ],
        children: numbers
            .map((e) =>
                renderContainer(color: rainbowColors[e % rainbowColors.length]))
            .toList(),
      ),
    );
  }

  Widget renderContainer({required Color color, int? index}) {
    return Container(
      height: 300,
      color: color,
    );
  }
}
