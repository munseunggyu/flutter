import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'fish_model.dart';

class FishC extends StatelessWidget {
  const FishC({super.key});

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
        ElevatedButton(
          onPressed: () {
            Provider.of<FishModel>(context, listen: false).changeFishNumber();
          },
          child: const Text(
            'number ++',
          ),
        )
      ],
    );
  }
}
