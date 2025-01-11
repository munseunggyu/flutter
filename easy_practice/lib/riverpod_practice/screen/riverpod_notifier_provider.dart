import 'package:easy_practice/riverpod/model/shopping_item_model.dart';
import 'package:easy_practice/riverpod/state_notifier_provider.dart';
import 'package:easy_practice/riverpod_practice/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodNotifierProvider extends ConsumerWidget {
  const RiverpodNotifierProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ShoppingItemModel> state = ref.watch(shoppingListProvider);
    return DefaultLayout(
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
      title: 'notifier',
    );
  }
}
