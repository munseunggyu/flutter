import 'package:flutter/material.dart';
import 'package:middle_class/restaurant/component/restaurant_card.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: RestaurantCard(
            deliveryFee: 1,
            deliveryTime: 1,
            name: 'dasdf',
            image: Image.asset(
              'asset/img/food/ddeok_bok_gi.jpg',
              fit: BoxFit.cover,
            ),
            tags: const ['sdf', 'asd', 'gs'],
            ratingCount: 1,
            ratings: 1.32,
          ),
        ),
      ),
    );
  }
}
