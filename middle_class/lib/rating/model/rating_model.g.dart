// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingModel _$RatingModelFromJson(Map<String, dynamic> json) => RatingModel(
      id: json['id'] as String,
      content: json['content'] as String,
      imgUrls:
          (json['imgUrls'] as List<dynamic>).map((e) => e as String).toList(),
      rating: (json['rating'] as num).toInt(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RatingModelToJson(RatingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imgUrls': instance.imgUrls,
      'user': instance.user,
      'content': instance.content,
      'rating': instance.rating,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'imageUrl': instance.imageUrl,
    };
