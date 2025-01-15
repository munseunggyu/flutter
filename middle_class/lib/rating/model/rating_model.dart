import 'package:json_annotation/json_annotation.dart';

part 'rating_model.g.dart';

@JsonSerializable()
class RatingModel {
  final String id;
  final List<String> imgUrls;
  final User user;
  final String content;
  final int rating;

  RatingModel(
      {required this.id,
      required this.content,
      required this.imgUrls,
      required this.rating,
      required this.user});

  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);
}

@JsonSerializable()
class User {
  final String id;
  final String username;
  final String imageUrl;

  User({
    required this.id,
    required this.imageUrl,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
