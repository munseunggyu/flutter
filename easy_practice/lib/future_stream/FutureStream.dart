import 'dart:math';

import 'package:flutter/material.dart';

class Futurestream extends StatefulWidget {
  const Futurestream({super.key});

  @override
  State<Futurestream> createState() => _FuturestreamState();
}

class _FuturestreamState extends State<Futurestream> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Future, Stream 연습',
        ),
      ),
      body: StreamBuilder<int>(
          stream: streamNumbers(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            print('----data-----');
            print('${snapshot.connectionState} ${snapshot.data}');

            // ConnectionState.none; -> Future, Stream이 입력되지 않은 상태
            // ConnectionState.active; -> Stream에서만 존재 / Stream이 실행중.
            // ConnectionState.waiting;  -> Future or Stream이 값 반환 전.
            // ConnectionState.done; -> Future or Stream이 종료되었을 경우
            // error
            if (snapshot.hasError) {
              final err = snapshot.error;
            }

            if (snapshot.hasData) {
              final data = snapshot.data;
              return NumberText(
                num: data.toString(),
              );
            }

            return const NumberText(
              num: '데이터가 없습니다.',
            );
          }),
    );
  }

  Future<int> getNumber() async {
    await Future.delayed(const Duration(seconds: 1));

    final random = Random();
    return random.nextInt(100);
  }

  Stream<int> streamNumbers() async* {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }
}

class NumberText extends StatelessWidget {
  final String num;
  const NumberText({super.key, required this.num});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(num),
    );
  }
}
