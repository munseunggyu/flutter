import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping_mall/constants.dart';
import 'package:shopping_mall/layout/layout_container.dart';
import 'package:shopping_mall/models/product.dart';

class ItemBasketPage extends StatefulWidget {
  const ItemBasketPage({super.key});

  @override
  State<ItemBasketPage> createState() => _ItemBasketPageState();
}

class _ItemBasketPageState extends State<ItemBasketPage> {
  List<Product> basketList = [
    Product(
        productNo: 5,
        productName: "포도(Grape)",
        productImageUrl: "https://picsum.photos/id/75/200/300",
        price: 75000),
    Product(
        productNo: 6,
        productName: "책(book)",
        productImageUrl: "https://picsum.photos/id/24/200/300",
        price: 24000),
  ];

  List<Map<int, int>> quantityList = [
    {5: 2},
    {6: 3}
  ];
  double totalPrice = 0;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < basketList.length; i++) {
      totalPrice +=
          (basketList[i].price! * quantityList[i][basketList[i].productNo]!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutContainer(
      title: '장바구니',
      bottom: Padding(
        padding: const EdgeInsets.all(20),
        child: FilledButton(
          onPressed: () {},
          child: Text(
            '결제하기: $totalPrice',
          ),
        ),
      ),
      children: ListView.builder(
        itemCount: basketList.length,
        itemBuilder: (context, index) {
          return basketContainer(
              productNo: basketList[index].productNo ?? 0,
              productDetails: basketList[index].productDetails ?? '',
              productName: basketList[index].productName ?? '',
              productImageUrl: basketList[index].productImageUrl ?? '',
              price: basketList[index].price ?? 0,
              quantity: quantityList[index][basketList[index].productNo] ?? 0);
        },
      ),
    );
  }

  Widget basketContainer(
      {required int productNo,
      required String productDetails,
      required String productName,
      required String productImageUrl,
      required double price,
      required num quantity}) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: productImageUrl,
            width: MediaQuery.of(context).size.width * 0.3,
            fit: BoxFit.cover,
            placeholder: (context, url) {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );
            },
            errorWidget: (context, url, error) {
              return const Center(
                child: Text(
                  '오류 발생',
                ),
              );
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                ),
                Text(
                  '${numberFormat.format(price)}원',
                ),
                Row(
                  children: [
                    const Text(
                      '수정',
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove,
                      ),
                    ),
                    Text(
                      '$quantity',
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                      ),
                    ),
                  ],
                ),
                Text(
                  '합계 ${numberFormat.format(price * quantity)}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
