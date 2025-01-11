import 'package:easy_practice/riverpod/family_modifier_provider.dart';
import 'package:easy_practice/riverpod_practice/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodFamilyModifierScreen extends ConsumerWidget {
  const RiverpodFamilyModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(familyModifierProvider(2));
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
