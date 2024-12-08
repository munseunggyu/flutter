import 'package:easy_practice/provider_practice/fish_model.dart';
import 'package:easy_practice/provider_practice/fish_order.dart';
import 'package:easy_practice/provider_practice/seafish_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderPractice extends StatelessWidget {
  const ProviderPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fish Order',
        ),
      ),
      body: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) => FishModel(
            name: 'Salmon',
            number: 10,
            size: 'big',
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => SeafishModel(
            name: 'Tuna',
            tunaNumber: 2,
            size: 'middle',
          ),
        )
      ], child: const FishOrder()),
      // 한개만 사용
      // body: ChangeNotifierProvider(
      //     create: (context) =>
      //         FishModel(name: 'Salmon', number: 10, size: 'big'),
      //     child: const FishOrder()),
    );
  }
}
