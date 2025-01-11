import 'package:easy_practice/riverpod/state_provider_screen.dart';
import 'package:easy_practice/riverpod_practice/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodStateProviderScreen extends ConsumerWidget {
  const RiverpodStateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
      title: 'RiverpodStateProviderScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).update(
                      (state) => state + 1,
                    );
              },
              child: const Text('up'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).state =
                    ref.read(numberProvider.notifier).state - 1;
              },
              child: const Text('down'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const _NextScreen()));
              },
              child: const Text('Next Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NextScreen extends ConsumerWidget {
  const _NextScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
      title: 'RiverpodStateProviderScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).update(
                      (state) => state + 1,
                    );
              },
              child: const Text('up'),
            )
          ],
        ),
      ),
    );
  }
}
