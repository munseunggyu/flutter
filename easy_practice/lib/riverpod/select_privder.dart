import 'package:easy_practice/riverpod/model/shopping_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectProvider = StateNotifierProvider<SelectNotifier, ShoppingItemModel>(
    (ref) => SelectNotifier());

class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier()
      : super(ShoppingItemModel(
            hasBount: false, name: 'test', quantity: 3, isSpicy: false));

  toggleHasBought() {
    state = state.copyWith(hasBount: !state.hasBount);
  }

  toggleHasIsSpicy() {
    state = state.copyWith(isSpicy: !state.isSpicy);
  }
}
