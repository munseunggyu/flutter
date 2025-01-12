import 'package:flutter/material.dart';
import 'package:middle_class/common/const/colors.dart';
import 'package:middle_class/common/const/data.dart';
import 'package:middle_class/restaurant/model/restaurant_detail_model.dart';
import 'package:middle_class/restaurant/model/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  final Widget image;
  final String name;
  final List<String> tags;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;
  final double ratings;
  final bool isDetail;
  final String? detail;
  final String? heroKey;

  const RestaurantCard({
    super.key,
    required this.image,
    required this.name,
    required this.deliveryFee,
    required this.deliveryTime,
    required this.ratingsCount,
    required this.ratings,
    required this.tags,
    this.isDetail = false,
    this.detail,
    this.heroKey,
  });

  factory RestaurantCard.fromModel(
      {required RestaurantModel model, bool isDetail = false}) {
    return RestaurantCard(
      image: Image.network(model.thumbUrl),
      name: model.name,
      deliveryFee: model.deliveryFee,
      deliveryTime: model.deliveryTime,
      ratingsCount: model.ratingsCount,
      ratings: model.ratings,
      tags: model.tags,
      isDetail: isDetail,
      heroKey: model.id,
      detail: model is RestaurantDetailModel ? model.detail : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (heroKey != null)
          Hero(
            tag: ObjectKey(heroKey),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                isDetail ? 0 : 12,
              ),
              child: image,
            ),
          ),
        if (heroKey == null)
          ClipRRect(
            borderRadius: BorderRadius.circular(
              isDetail ? 0 : 12,
            ),
            child: image,
          ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isDetail ? 16 : 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                tags.join(
                  ' · ',
                ),
                style: const TextStyle(
                  color: BODY_TEXT_COLOR,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  _IconText(
                    icon: Icons.star,
                    label: ratings.toString(),
                  ),
                  renderDot(),
                  _IconText(
                    icon: Icons.receipt,
                    label: ratingsCount.toString(),
                  ),
                  renderDot(),
                  _IconText(
                    icon: Icons.timelapse_outlined,
                    label: '$deliveryTime 분',
                  ),
                  renderDot(),
                  _IconText(
                    icon: Icons.monetization_on,
                    label: '${deliveryFee == 0 ? '무료' : deliveryFee}',
                  ),
                ],
              ),
              if (detail != null && isDetail)
                Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    child: Text(detail!))
            ],
          ),
        )
      ],
    );
  }

  Widget renderDot() {
    return const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 4,
        ),
        child: Text(
          ' · ',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ));
  }
}

class _IconText extends StatelessWidget {
  final IconData icon;
  final String label;
  const _IconText({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: PRIMARY_COLOR,
          size: 14,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
