import 'package:middle_class/common/const/data.dart';
import 'package:middle_class/restaurant/model/restaurant_model.dart';

class DataUtils {
  static parsePriceRange(RestaurantPriceRange value) {
    return RestaurantPriceRange.values.firstWhere((e) => e.name == value);
  }

  static pathToUrl(String value) {
    return '$ip$value';
  }
}
