import 'package:easy_practice/provider_practice/fish_high.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'fish_model.dart';

class FishOrder extends StatelessWidget {
  const FishOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Fish ${Provider.of<FishModel>(context).name}',
          ),
          const SizedBox(
            height: 20,
          ),
          const FishHigh()
        ],
      ),
    );
  }
}
