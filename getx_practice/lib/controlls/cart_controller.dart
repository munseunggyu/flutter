import 'package:get/get.dart';
import 'package:getx_practice/models/product_model.dart';

class CartController extends GetxController {
  var cartItems = <ProductModel>[].obs;
  double get totalPrice => cartItems.fold(0, (e, item) => e + item.price);

  void addToItem(ProductModel product) {
    cartItems.add(product);
  }
}
