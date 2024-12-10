import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controlls/cart_controller.dart';
import 'package:getx_practice/controlls/shopping_controller.dart';
import 'package:getx_practice/models/product_model.dart';

class ShoppingScreen extends StatelessWidget {
  final shoppingController = Get.put<ShoppingController>(ShoppingController());

  final cartController = Get.put<CartController>(CartController());

  ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(builder: (controller) {
              if (controller.products.isEmpty) {
                return const CircularProgressIndicator();
              }

              return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    ProductModel product = controller.products[index];
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.products[index].productName,
                                      style: const TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                    Text(
                                      product.productDescription,
                                    ),
                                  ],
                                ),
                                Text(
                                  '\$${product.price}',
                                  style: const TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: () {
                                    cartController.addToItem(product);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        5,
                                      ),
                                    ),
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                  ),
                                  child: const Text(
                                    'Add to Cart',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }),
          ),
          const SizedBox(
            height: 10,
          ),
          GetX<CartController>(builder: (controller) {
            return Text(
              'Total amount \$${controller.totalPrice}',
            );
          }),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              'item cart',
            ),
          ),
        ],
      ),
    );
  }
}
