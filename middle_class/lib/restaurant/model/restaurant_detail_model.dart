import 'package:middle_class/restaurant/model/restaurant_model.dart';

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

  factory RestaurantDetailModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    print(json['products']);
    return RestaurantDetailModel(
      id: json['id'],
      deliveryFee: json['deliveryFee'],
      deliveryTime: json['deliveryTime'],
      name: json['name'],
      priceRange: RestaurantPriceRange.high,
      ratings: json['ratings'],
      ratingsCount: json['ratingsCount'],
      tags: List<String>.from(json['tags']),
      thumbUrl: json['thumbUrl'],
      detail: json['detail'],
      products: json['products']
          .map<RestaurantProductModel>(
            (x) => RestaurantProductModel.fromJson(json: x),
          )
          .toList(),
    );
  }
}

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

  factory RestaurantProductModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return RestaurantProductModel(
        id: json['id'],
        imgUrl: json['imgUrl'], // json['thumbUrl']
        detail: json['detail'],
        name: json['name'],
        price: json['price']);
  }
}
