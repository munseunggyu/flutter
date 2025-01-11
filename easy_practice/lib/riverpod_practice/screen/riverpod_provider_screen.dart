import 'package:easy_practice/riverpod/provider.dart';
import 'package:easy_practice/riverpod/state_notifier_provider.dart';
import 'package:easy_practice/riverpod_practice/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodProviderScreen extends ConsumerWidget {
  const RiverpodProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filteredShoppingList);
    return DefaultLayout(
        actions: [
          PopupMenuButton<FilterState>(
            itemBuilder: (_) => FilterState.values
                .map(
                  (e) => PopupMenuItem(
                    value: e,
                    child: Text(e.name),
                  ),
                )
                .toList(),
            onSelected: (value) {
              ref.read(filterProvider.notifier).update((state) => value);
            },
          ),
        ],
        body: ListView(
          children: state
              .map((e) => CheckboxListTile(
                    value: e.hasBount,
                    onChanged: (value) {
                      ref
                          .read(shoppingListProvider.notifier)
                          .toggleHasBought(name: e.name);
                    },
                    title: Text(e.name),
                  ))
              .toList(),
        ),
        title: 'RiverpodProviderScreen');
  }
}
