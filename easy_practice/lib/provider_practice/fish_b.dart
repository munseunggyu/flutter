import 'package:easy_practice/provider_practice/low_widget.dart';
import 'package:easy_practice/provider_practice/seafish_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'fish_model.dart';

class FishB extends StatelessWidget {
  const FishB({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Fish ${Provider.of<SeafishModel>(context).tunaNumber}',
          style: const TextStyle(
            color: Colors.red,
          ),
        ),
        Text(
          'Fish ${Provider.of<SeafishModel>(context).size}',
          style: const TextStyle(
            color: Colors.red,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Provider.of<SeafishModel>(context, listen: false)
                .changeFishNumber();
          },
          child: const Text('Tuna'),
        ),
        const SizedBox(
          height: 20,
        ),
        const LowWidget(),
      ],
    );
  }
}
