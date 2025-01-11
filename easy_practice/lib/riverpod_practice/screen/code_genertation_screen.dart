import 'package:easy_practice/riverpod/code_generation_provider.dart';
import 'package:easy_practice/riverpod_practice/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodeGenertationScreen extends ConsumerWidget {
  const CodeGenertationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gStateProvider);
    return DefaultLayout(
        body: Column(
          children: [Text('state1: $state')],
        ),
        title: 'CodeGenertationScreen');
  }
}
