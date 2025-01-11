import 'package:easy_practice/riverpod/model/shopping_item_model.dart';
import 'package:easy_practice/riverpod/state_notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filteredShoppingList = Provider<List<ShoppingItemModel>>((ref) {
  final filterState = ref.watch(filterProvider);
  final shoppingList = ref.watch(shoppingListProvider);

  if (filterState == FilterState.all) {
    return shoppingList;
  }

  return shoppingList
      .where((e) => filterState == FilterState.spicy ? e.isSpicy : !e.isSpicy)
      .toList();
});

enum FilterState { notSpicy, spicy, all }

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
