import 'package:easy_practice/riverpod_practice/default_layout.dart';
import 'package:easy_practice/riverpod_practice/screen/riverpod_autodispose_modifier_screen.dart';
import 'package:easy_practice/riverpod_practice/screen/riverpod_family_modifier_screen.dart';
import 'package:easy_practice/riverpod_practice/screen/riverpod_future_screen.dart';
import 'package:easy_practice/riverpod_practice/screen/riverpod_notifier_provider.dart';
import 'package:easy_practice/riverpod_practice/screen/riverpod_state_provider_screen.dart';
import 'package:easy_practice/riverpod_practice/screen/riverpod_stream_screen.dart';
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
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const RiverpodNotifierProvider()));
            },
            child: const Text('RiverpodNotifierProvider'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const RiverpodFutureScreen()));
            },
            child: const Text('RiverpodFutureScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const RiverpodStreamScreen()));
            },
            child: const Text('RiverpodStreamScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const RiverpodFamilyModifierScreen()));
            },
            child: const Text('RiverpodFamilyModifierScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const RiverpodAutodisposeModifierScreen()));
            },
            child: const Text('RiverpodAutodisposeModifierScreen'),
          ),
        ],
      ),
    );
  }
}
