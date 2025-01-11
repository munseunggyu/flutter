import 'package:easy_practice/CustomScoll/custom_scroll_view_screen.dart';
import 'package:easy_practice/CustomScoll/refresh_indicator.dart';
import 'package:easy_practice/GridViewPractice/grid_view_practice.dart';
import 'package:easy_practice/ListViewPractice/list_view_practice.dart';
import 'package:easy_practice/ReorderableListViewPractice/re_orderable_list_view_practice.dart';
import 'package:easy_practice/SingleChildScroll/single_child_scroll.dart';
import 'package:easy_practice/agora_test/agora_test.dart';
import 'package:easy_practice/future_stream/FutureStream.dart';
import 'package:easy_practice/provider_practice/provider_practice.dart';
import 'package:easy_practice/riverpod/provider_observer.dart';
import 'package:easy_practice/riverpod_practice/riverpot_main.dart';
import 'package:easy_practice/screens/home_screen.dart';
// import 'package:easy_practice/Navigators/navigation_pracitce.dart';
// import 'package:easy_practice/Navigators/route_one_screen.dart';
// import 'package:easy_practice/Navigators/route_three_screen.dart';
// import 'package:easy_practice/Navigators/route_two_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [
        Logger(),
      ],
      child: MaterialApp(
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
        // home: const AgoraTest()
        // home: const SingleChildScroll(),
        // home: ListViewPractice(),
        // home: GridViewPractice(),
        // home: const ReOrderableListViewPractice(),
        // home: CustomScrollViewScreen(),
        // home: RefreshIndicatorScreen(),
        home: const RiverpotMain(),

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
    ),
  );
}
