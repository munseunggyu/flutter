import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping_mall/constants.dart';

class ItemDetailsPage extends StatefulWidget {
  int productNo;
  String productName;
  String productDetails;
  String productImageUrl;
  double price;
  ItemDetailsPage(
      {super.key,
      required this.productNo,
      required this.productName,
      required this.productDetails,
      required this.productImageUrl,
      required this.price});

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.productName} 상세 페이지'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: CachedNetworkImage(
                imageUrl: widget.productImageUrl,
                width: MediaQuery.of(context).size.width * 0.8,
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
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Text(
                widget.productName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Text(
                numberFormat.format(widget.price),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: FilledButton(
          onPressed: () {},
          child: const Text(
            '장바구니 담기',
          ),
        ),
      ),
    );
  }
}
