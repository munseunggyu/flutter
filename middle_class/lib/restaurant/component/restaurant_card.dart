import 'package:flutter/material.dart';
import 'package:middle_class/common/const/colors.dart';

class RestaurantCard extends StatelessWidget {
  final Widget image;
  final String name;
  final List<String> tags;
  final int ratingCount;
  final int deliveryTime;
  final int deliveryFee;
  final double ratings;

  const RestaurantCard({
    super.key,
    required this.image,
    required this.name,
    required this.deliveryFee,
    required this.deliveryTime,
    required this.ratingCount,
    required this.ratings,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            12,
          ),
          child: image,
        ),
        const SizedBox(
          height: 16,
        ),
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
              label: ratingCount.toString(),
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
