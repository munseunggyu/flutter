import 'package:get/get.dart';
import 'package:getx_practice/models/product_model.dart';

class ShoppingController extends GetxController {
  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    var productData = [
      ProductModel(
        id: 1,
        price: 30,
        productDescription: 'some description about product',
        productName: 'Mouse',
      ),
      ProductModel(
        id: 2,
        price: 23,
        productDescription: 'some description about Keyborad',
        productName: 'Keyborad',
      ),
      ProductModel(
        id: 3,
        price: 630,
        productDescription: 'some description about Monitor',
        productName: 'Monitor',
      ),
      ProductModel(
        id: 4,
        price: 130,
        productDescription: 'some description about Ram',
        productName: 'Ram',
      ),
      ProductModel(
        id: 5,
        price: 580,
        productDescription: 'some description about Wow',
        productName: 'Wow',
      ),
    ];

    // 데이터 넣어주기.
    products.assignAll(productData);
  }
}
