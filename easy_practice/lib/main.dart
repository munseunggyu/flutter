import 'package:easy_practice/future_stream/FutureStream.dart';
import 'package:easy_practice/screens/home_screen.dart';
// import 'package:easy_practice/Navigators/navigation_pracitce.dart';
// import 'package:easy_practice/Navigators/route_one_screen.dart';
// import 'package:easy_practice/Navigators/route_three_screen.dart';
// import 'package:easy_practice/Navigators/route_two_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        theme: ThemeData(
          fontFamily: 'sunflower',
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              color: Colors.white,
              fontSize: 80,
              fontFamily: 'parisienne',
            ),
          ),
        ),
        // home: const HomeScreen(),
        home: const Futurestream()

        // 라우트 예제;
        // initialRoute: '/',
        // routes: {
        //   '/': (BuildContext context) => const HomeScreen(),
        //   '/one': (BuildContext context) => const RouteOneScreen(
        //         number: 32,
        //       ),
        //   '/two': (BuildContext context) => const RouteTwoScreen(),
        //   '/three': (BuildContext context) => const RouteThreeScreen(),
        // },
        ),
  );
}
