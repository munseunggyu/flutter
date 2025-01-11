import 'package:easy_practice/riverpod/model/shopping_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
        (ref) => ShoppingListNotifier());

class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  ShoppingListNotifier()
      : super([
          ShoppingItemModel(
              name: 'name', quantity: 3, hasBount: false, isSpicy: true),
          ShoppingItemModel(
              name: '라면', quantity: 5, hasBount: false, isSpicy: true),
          ShoppingItemModel(
              name: '삼겹살', quantity: 10, hasBount: false, isSpicy: false),
          ShoppingItemModel(
              name: '삼겹살1', quantity: 10, hasBount: false, isSpicy: false),
          ShoppingItemModel(
              name: '삼겹살2', quantity: 10, hasBount: false, isSpicy: false),
        ]);

  void toggleHasBought({required String name}) {
    state = state.map((e) {
      if (e.name == name) {
        return ShoppingItemModel(
            name: e.name,
            quantity: e.quantity,
            hasBount: !e.hasBount,
            isSpicy: e.isSpicy);
      }
      return e;
    }).toList();
  }
}
