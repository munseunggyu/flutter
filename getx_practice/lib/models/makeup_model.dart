import 'package:get/get.dart';

// description, heart, img, star, price
class MakeupModel extends GetxController {
  int id;
  String name;
  double price;
  String? imageLink;
  double? rating;
  bool heart;

  MakeupModel({
    required this.id,
    this.imageLink,
    required this.name,
    required this.price,
    this.rating,
    this.heart = false,
  });

  factory MakeupModel.fromJson(Map<String, dynamic> json) {
    return MakeupModel(
      id: json['id'],
      imageLink: json['image_link'],
      name: json['name'],
      price: double.parse(json['price']),
      rating: json['rating'] ?? 0.0,
      heart: false,
    );
  }
}
