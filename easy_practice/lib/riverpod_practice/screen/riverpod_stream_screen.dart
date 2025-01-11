import 'package:easy_practice/riverpod/state_stream_provider.dart';
import 'package:easy_practice/riverpod_practice/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodStreamScreen extends ConsumerWidget {
  const RiverpodStreamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(multiplesStreamProvider);

    return DefaultLayout(
      title: 'Future Provider Screen',
      body: Column(
        children: [
          state.when(
            data: (data) {
              return Text(data.toString());
            },
            error: (error, stack) {
              return Text(error.toString());
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
