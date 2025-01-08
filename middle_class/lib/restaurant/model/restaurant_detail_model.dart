import 'package:json_annotation/json_annotation.dart';
import 'package:middle_class/common/utils/data_utils.dart';
import 'package:middle_class/restaurant/model/restaurant_model.dart';

part 'restaurant_detail_model.g.dart';

@JsonSerializable()
class RestaurantDetailModel extends RestaurantModel {
  final String detail;
  final List<RestaurantProductModel> products;

  RestaurantDetailModel(
      {required super.id,
      required super.deliveryFee,
      required super.deliveryTime,
      required super.name,
      required super.priceRange,
      required super.ratings,
      required super.ratingsCount,
      required super.tags,
      required super.thumbUrl,
      required this.detail,
      required this.products});

  factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDetailModelFromJson(json);

  static parsePriceRange(RestaurantPriceRange value) {
    return RestaurantPriceRange.values.firstWhere((e) => e.name == value);
  }

  // factory RestaurantDetailModel.fromJson({
  //   required Map<String, dynamic> json,
  // }) {
  //   return RestaurantDetailModel(
  //     id: json['id'],
  //     deliveryFee: json['deliveryFee'],
  //     deliveryTime: json['deliveryTime'],
  //     name: json['name'],
  //     priceRange: RestaurantPriceRange.values
  //         .firstWhere((e) => e.name == json['priceRange']),
  //     ratings: json['ratings'],
  //     ratingsCount: json['ratingsCount'],
  //     tags: List<String>.from(json['tags']),
  //     thumbUrl: json['thumbUrl'],
  //     detail: json['detail'],
  //     products: json['products']
  //         .map<RestaurantProductModel>(
  //           (x) => RestaurantProductModel.fromJson(x),
  //         )
  //         .toList(),
  //   );
  // }
}

@JsonSerializable()
class RestaurantProductModel {
  final String id;
  final String name;
  final String imgUrl;
  final String detail;
  final int price;

  RestaurantProductModel({
    required this.detail,
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.price,
  });

  factory RestaurantProductModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantProductModelFromJson(json);

  // factory RestaurantProductModel.fromJson({
  //   required Map<String, dynamic> json,
  // }) {
  //   return RestaurantProductModel(
  //       id: json['id'],
  //       imgUrl: json['imgUrl'], // json['thumbUrl']
  //       detail: json['detail'],
  //       name: json['name'],
  //       price: json['price']);
  // }
}
