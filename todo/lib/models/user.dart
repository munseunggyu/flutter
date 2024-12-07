import 'package:intl/intl.dart';
import 'package:todo/models/user_dob.dart';
import 'package:todo/models/user_location.dart';
import 'package:todo/models/user_name.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation userLocation;

  User(
      {required this.gender,
      required this.email,
      required this.phone,
      required this.cell,
      required this.nat,
      required this.name,
      required this.dob,
      required this.userLocation});

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }

  String get formatDate {
    final DateFormat formatting = DateFormat('yy-MM-dd');
    return formatting.format(dob.date);
  }

  factory User.fromJSON(Map<String, dynamic> e) {
    final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last']);

    final dob =
        UserDob(date: DateTime.parse(e['dob']['date']), age: e['dob']['age']);

    final location = e['location'];

    final userLocation = UserLocation(
        city: location['city'],
        state: location['state'],
        country: location['country'],
        postcode: location['postcode'],
        street: Street(
            name: location['street']['name'],
            number: location['street']['number']),
        coordinates: Coordinates(
            longitude: location['coordinates']['longitude'],
            latitude: location['coordinates']['latitude']),
        timezone: Timezone(
            offset: location['timezone']['offset'],
            description: location['timezone']['description']));

    return User(
        gender: e['gender'],
        email: e['email'],
        phone: e['phone'],
        cell: e['cell'],
        nat: e['nat'],
        name: name,
        dob: dob,
        userLocation: userLocation);
  }
}
