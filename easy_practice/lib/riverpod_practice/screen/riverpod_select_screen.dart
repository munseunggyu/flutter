import 'package:easy_practice/riverpod/select_privder.dart';
import 'package:easy_practice/riverpod_practice/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodSelectScreen extends ConsumerWidget {
  const RiverpodSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(selectProvider);
    return DefaultLayout(
        body: Column(
          children: [
            // Text(state.name),
            Text(state.isSpicy.toString()),
            // Text(state.hasBount.toString()),
            ElevatedButton(
                onPressed: () {
                  ref.read(selectProvider.notifier).toggleHasBought();
                },
                child: const Text('맵기 변경'))
          ],
        ),
        title: 'RiverpodSelectScreen');
  }
}
