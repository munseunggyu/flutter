import 'dart:async';

import 'package:flutter/material.dart';

class TimerPractice extends StatefulWidget {
  const TimerPractice({
    super.key,
  });

  @override
  State<TimerPractice> createState() => _TimerPracticeState();
}

class _TimerPracticeState extends State<TimerPractice> {
  Timer? timer;
  PageController controller = PageController(
    initialPage: 0,
  );

  final imgList = [
    'asset/img/image_1.jpeg',
    'asset/img/image_2.jpeg',
    'asset/img/image_3.jpeg',
    'asset/img/image_4.jpeg',
    'asset/img/image_5.jpeg',
  ];

  var img = 'asset/img/image_1.jpeg';

  void changeImg() {
    var number = 1;

    Timer.periodic(
      const Duration(seconds: 1),
      (t) {
        setState(() {
          img = imgList[number];
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(seconds: 2),
      (t) {
        if (controller.page == null) return;
        int currentPage = controller.page!.toInt();
        int nextPage = currentPage + 1;

        if (nextPage > 4) {
          nextPage = 0;
        }
        controller.animateToPage(nextPage,
            duration: const Duration(milliseconds: 400), curve: Curves.ease);
      },
    );
  }

  // void timer() {
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: imgList
          .map(
            (e) => Image.asset(
              e,
              fit: BoxFit.cover,
            ),
          )
          .toList(),
    );
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    controller.dispose();
    super.dispose();
  }
}
