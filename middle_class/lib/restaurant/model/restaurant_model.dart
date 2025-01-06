enum RestaurantPriceRange { high, medium, low }

class RestaurantModel {
  final String id;
  final String name;
  final String thumbUrl;
  final List<String> tags;
  final RestaurantPriceRange priceRange;
  final double ratings;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;

  const RestaurantModel({
    required this.id,
    required this.deliveryFee,
    required this.deliveryTime,
    required this.name,
    required this.priceRange,
    required this.ratings,
    required this.ratingsCount,
    required this.tags,
    required this.thumbUrl,
  });

  factory RestaurantModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return RestaurantModel(
      id: json['id'],
      deliveryFee: json['deliveryFee'],
      deliveryTime: json['deliveryTime'],
      name: json['name'],
      // priceRange: RestaurantPriceRange.values
      //     .firstWhere((e) => e.name == json['priceRange']),
      priceRange: RestaurantPriceRange.high,
      ratings: json['ratings'],
      ratingsCount: json['ratingsCount'],
      tags: List<String>.from(json['tags']),
      thumbUrl: json['thumbUrl'],
    );
  }
}
