import 'package:flutter/material.dart';
import 'package:middle_class/common/const/colors.dart';

class ProductCard extends StatelessWidget {
  final Widget image;
  final String name;
  final String detail;
  final int price;

  const ProductCard(
      {super.key,
      required this.image,
      required this.name,
      required this.detail,
      required this.price});

  @override
  Widget build(BuildContext context) {
    print(image);
    return Column(
      children: [
        IntrinsicHeight(
          // 최대 크기 높이됨
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  8.0,
                ),
                child: image,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      detail,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        color: BODY_TEXT_COLOR,
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      '￦$price',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: PRIMARY_COLOR,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
