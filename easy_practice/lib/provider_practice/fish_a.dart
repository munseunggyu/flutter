import 'package:easy_practice/provider_practice/fish_model.dart';
import 'package:easy_practice/provider_practice/middle_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FishA extends StatelessWidget {
  const FishA({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Fish ${Provider.of<FishModel>(context).number}',
          style: const TextStyle(
            color: Colors.red,
          ),
        ),
        Text(
          'Fish ${Provider.of<FishModel>(context).size}',
          style: const TextStyle(
            color: Colors.red,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const MiddleWidget()
      ],
    );
  }
}
