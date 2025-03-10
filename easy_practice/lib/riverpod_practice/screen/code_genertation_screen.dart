import 'package:easy_practice/riverpod/code_generation_provider.dart';
import 'package:easy_practice/riverpod_practice/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodeGenertationScreen extends ConsumerWidget {
  const CodeGenertationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(number1: 3, number2: 2));

    print('build');
    return DefaultLayout(
        body: Column(
          children: [
            Text(
              'state1: $state',
            ),
            state2.when(
              data: (data) {
                return Text(
                  'state2: ${data.toString()}',
                );
              },
              error: (err, stack) => Text(err.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
            state3.when(
              data: (data) {
                return Text(
                  'state3: ${data.toString()}',
                );
              },
              error: (err, stack) => Text(err.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
            Text(
              'state4: $state4',
            ),
            Consumer(
              builder: (context, ref, child) {
                final state5 = ref.watch(gStateNotifierProvider);
                return Row(
                  children: [
                    Text(
                      'state5: $state5',
                    ),
                    child!
                  ],
                );
              },
              child: const Text('child'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(gStateNotifierProvider.notifier).increment();
              },
              child: const Text('up'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(gStateNotifierProvider);
              },
              child: const Text('invalidate'),
            ),
          ],
        ),
        title: 'CodeGenertationScreen');
  }
}
