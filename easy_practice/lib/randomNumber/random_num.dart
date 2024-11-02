import 'dart:math';

import 'package:easy_practice/constant/color.dart';
import 'package:easy_practice/randomNumber/setting_screen.dart';
import 'package:flutter/material.dart';

class RandomNum extends StatefulWidget {
  const RandomNum({
    super.key,
  });

  @override
  State<RandomNum> createState() => _RandomNumState();
}

class _RandomNumState extends State<RandomNum> {
  List<int> numList = [123, 456, 789];
  double maxNum = 0;
  void genRandomNum() {
    var rng = Random();
    for (int i = 0; i < 3; i++) {
      setState(() {
        var hi = rng.nextInt(899) + 100;
        numList[i] = hi;
      });
    }
  }

  void goSetting() async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return SettingScreen(
            maxNumber: maxNum,
          );
        },
      ),
    );
    setState(() {
      maxNum = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Header(goSetting: goSetting),
              _Body(
                numList: numList,
              ),
              _Footer(genRandomNum: genRandomNum)
            ],
          ),
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback genRandomNum;

  const _Footer({super.key, required this.genRandomNum});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('random'),
        ElevatedButton(
          onPressed: genRandomNum,
          style: ElevatedButton.styleFrom(
              backgroundColor: redColor, foregroundColor: Colors.white),
          child: const Text(
            'data',
          ),
        ),
      ],
    );
  }
}

class _Body extends StatefulWidget {
  final List<int> numList;
  const _Body({required this.numList});

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: widget.numList.map(
            (e) {
              var hi = e.toString().split('').map((el) {
                return Image.asset(
                  'asset/img/$el.png',
                  width: 50,
                  height: 50,
                );
              });
              return Row(
                children: [...hi],
              );
            },
          ).toList(),
        ),
      ],
    ));
  }
}

class _Header extends StatefulWidget {
  final VoidCallback goSetting;
  const _Header({super.key, required this.goSetting});

  @override
  State<_Header> createState() => _HeaderState();
}

class _HeaderState extends State<_Header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '랜덤 숫자 생성기!',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        IconButton(
          onPressed: widget.goSetting,
          icon: const Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
