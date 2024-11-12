import 'package:flutter/material.dart';
import 'package:shopping_mall/layout/layout_container.dart';

class ItemBasketPage extends StatefulWidget {
  const ItemBasketPage({super.key});

  @override
  State<ItemBasketPage> createState() => _ItemBasketPageState();
}

class _ItemBasketPageState extends State<ItemBasketPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutContainer(
      title: '장바구니',
      children: [
        Container(),
      ],
    );
  }
}
