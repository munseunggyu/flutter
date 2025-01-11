import 'package:easy_practice/riverpod/family_autodispose_provider.dart';
import 'package:easy_practice/riverpod_practice/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodAutodisposeModifierScreen extends ConsumerWidget {
  const RiverpodAutodisposeModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(autodisposeModifierProvider);
    return DefaultLayout(
        body: Center(
          child: Text(state.when(
            data: (data) => data.toString(),
            error: (error, stackTrace) => error.toString(),
            loading: () => 'Loading...',
          )),
        ),
        title: 'RiverpodFamilyModifierScreen');
  }
}
