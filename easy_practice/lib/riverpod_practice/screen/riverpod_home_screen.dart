import 'package:easy_practice/riverpod_practice/default_layout.dart';
import 'package:easy_practice/riverpod_practice/screen/riverpod_state_provider_screen.dart';
import 'package:flutter/material.dart';

class RiverpodHomeScreen extends StatelessWidget {
  const RiverpodHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Home Screen',
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const RiverpodStateProviderScreen()));
            },
            child: const Text(
              'State Provider Screen',
            ),
          ),
        ],
      ),
    );
  }
}
