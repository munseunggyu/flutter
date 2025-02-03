// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingModel _$RatingModelFromJson(Map<String, dynamic> json) => RatingModel(
      id: json['id'] as String,
      content: json['content'] as String,
      imgUrls: DataUtils.listPathsToUrls(json['imgUrls'] as List<String>),
      rating: (json['rating'] as num).toInt(),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RatingModelToJson(RatingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imgUrls': instance.imgUrls,
      'user': instance.user,
      'content': instance.content,
      'rating': instance.rating,
    };
