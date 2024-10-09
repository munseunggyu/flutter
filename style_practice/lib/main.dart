import 'package:flutter/material.dart';
import 'package:style_practice/widgets/button.dart';
import 'package:style_practice/widgets/card.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Hey, MSG',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Welcome back',
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.8)),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Total Balance',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '\$9 999 999',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 38,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButton(
                        text: 'Transfer',
                        bgColor: Colors.amber,
                        txtColor: Colors.black),
                    MyButton(
                        text: 'Request',
                        bgColor: Color(0xFF1f2123),
                        txtColor: Colors.white),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Wallets',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CardComponent(
                    bgColor: Color(0xFF1f2123),
                    txtColor: Colors.white,
                    txt1: 'txt1',
                    txt2: 'txt2',
                    txt3: 'txt3',
                    icon: Icon(
                      Icons.euro_rounded,
                      color: Colors.white,
                      size: 68,
                    )),
                Transform.translate(
                  offset: const Offset(0, -50),
                  child: const CardComponent(
                      bgColor: Colors.white,
                      txtColor: Colors.black,
                      txt1: 'txt1',
                      txt2: 'txt2',
                      txt3: 'txt3',
                      icon: Icon(
                        Icons.euro_rounded,
                        size: 68,
                      )),
                ),
                Transform.translate(
                  offset: const Offset(0, -100),
                  child: const CardComponent(
                    bgColor: Color(0xFF1f2123),
                    txtColor: Colors.white,
                    txt1: 'txt1',
                    txt2: 'txt2',
                    txt3: 'txt3',
                    icon: Icon(
                      Icons.euro_rounded,
                      color: Colors.white,
                      size: 68,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
