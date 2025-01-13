import 'package:flutter/material.dart';
import 'package:middle_class/common/const/colors.dart';
import 'package:collection/collection.dart';

class RatingCard extends StatelessWidget {
  final ImageProvider avatarImage;
  final int rating;
  final String email;
  final List<Image> images;
  final String content;

  const RatingCard({
    super.key,
    required this.avatarImage,
    required this.images,
    required this.rating,
    required this.email,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Header(
          avatarImage: avatarImage,
          email: email,
          rating: rating,
        ),
        const SizedBox(
          height: 8,
        ),
        _Body(
          content: content,
        ),
        const SizedBox(
          height: 8,
        ),
        if (images.isNotEmpty)
          SizedBox(
            height: 100,
            child: _Images(
              images: images,
            ),
          ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  final ImageProvider avatarImage;
  final int rating;
  final String email;
  const _Header({
    super.key,
    required this.avatarImage,
    required this.email,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: avatarImage,
          radius: 12,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Text(
            email,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        ...List.generate(
          rating,
          (index) => Icon(
            index < rating ? Icons.star : Icons.star_outline_outlined,
            color: PRIMARY_COLOR,
          ),
        ),
      ],
    );
  }
}

class _Images extends StatelessWidget {
  final List<Image> images;
  const _Images({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: images
          .mapIndexed(
            (index, e) => Padding(
              padding: EdgeInsets.only(right: index < images.length ? 8 : 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: e,
              ),
            ),
          )
          .toList(),
    );
  }
}

class _Body extends StatelessWidget {
  final String content;
  const _Body({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            content,
            style: const TextStyle(
              color: BODY_TEXT_COLOR,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
