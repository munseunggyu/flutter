class UserLocation {
  final String city;
  final String state;
  final String country;
  final dynamic postcode;
  final Street street;
  final Coordinates coordinates;
  final Timezone timezone;

  UserLocation(
      {required this.city,
      required this.state,
      required this.country,
      required this.postcode,
      required this.street,
      required this.coordinates,
      required this.timezone});
}

class Street {
  final int number;
  final String name;

  Street({required this.name, required this.number});
}

class Coordinates {
  final String latitude;
  final String longitude;

  Coordinates({required this.longitude, required this.latitude});
}

class Timezone {
  final String offset;
  final String description;

  Timezone({required this.offset, required this.description});
}
