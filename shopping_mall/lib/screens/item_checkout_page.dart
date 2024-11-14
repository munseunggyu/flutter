import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping_mall/constants.dart';
import 'package:shopping_mall/layout/layout_container.dart';
import 'package:shopping_mall/models/product.dart';

class ItemCheckoutPage extends StatefulWidget {
  const ItemCheckoutPage({super.key});

  @override
  State<ItemCheckoutPage> createState() => _ItemCheckoutPageState();
}

class _ItemCheckoutPageState extends State<ItemCheckoutPage> {
  List<Product> checkoutList = [
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

  TextEditingController buyerNameController = TextEditingController();

  TextEditingController buyerEmailController = TextEditingController();

  TextEditingController buyerPhoneController = TextEditingController();

  TextEditingController receiverNameController = TextEditingController();

  TextEditingController receiverPhoneController = TextEditingController();

  TextEditingController receiverZipController = TextEditingController();

  TextEditingController receiverAddress1Controller = TextEditingController();

  TextEditingController receiverAddress2Controller = TextEditingController();

  TextEditingController userPwdController = TextEditingController();

  TextEditingController userConfirmPwdController = TextEditingController();

  TextEditingController cardNoController = TextEditingController();

  TextEditingController cardAuthController = TextEditingController();

  TextEditingController cardExpiredDateController = TextEditingController();

  TextEditingController cardPwdTwoDigitsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < checkoutList.length; i++) {
      totalPrice += (checkoutList[i].price! *
          quantityList[i][checkoutList[i].productNo]!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutContainer(
      title: '결제하기',
      bottom: Padding(
        padding: const EdgeInsets.all(20),
        child: FilledButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const ItemCheckoutPage();
            }));
          },
          child: Text(
            '결제하기: ${numberFormat.format(totalPrice)}',
          ),
        ),
      ),
      children: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: checkoutList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return basketContainer(
                    productNo: checkoutList[index].productNo ?? 0,
                    productDetails: checkoutList[index].productDetails ?? '',
                    productName: checkoutList[index].productName ?? '',
                    productImageUrl: checkoutList[index].productImageUrl ?? '',
                    price: checkoutList[index].price ?? 0,
                    quantity: quantityList[index]
                            [checkoutList[index].productNo] ??
                        0);
              },
            ),
            buyerNameTextField()
          ],
        ),
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
                    Text(
                      '수량: $quantity개',
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

  Widget buyerNameTextField() {
    return Padding(
      padding: const EdgeInsets.all(
        8,
      ),
      child: TextFormField(
        controller: buyerNameController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: '주문자명',
        ),
      ),
    );
  }
}
