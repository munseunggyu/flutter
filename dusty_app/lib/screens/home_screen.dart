import 'package:dusty_app/component/category_stat.dart';
import 'package:dusty_app/component/hourly_stat.dart';
import 'package:dusty_app/component/main_stat.dart';
import 'package:dusty_app/const/color.dart';
import 'package:dusty_app/repository/stat_repository.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: StatRepository.fetchData(),
            builder: (context, snapshot) {
              print(snapshot.data);
              return const Column(
                children: [
                  MainStat(),
                  CategoryStat(),
                  HourlyStat(),
                ],
              );
            }),
      ),
    );
  }
}
