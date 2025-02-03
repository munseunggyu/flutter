import 'package:json_annotation/json_annotation.dart';
import 'package:middle_class/common/utils/data_utils.dart';
import 'package:middle_class/user/model/user_model.dart';

part 'rating_model.g.dart';

@JsonSerializable()
class RatingModel {
  final String id;
  @JsonKey(fromJson: DataUtils.listPathsToUrls)
  final List<String> imgUrls;
  final UserModel user;
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
