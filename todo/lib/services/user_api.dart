import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo/models/user.dart';

class UserApi {
  static Future<List<User>> fetchUser() async {
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final transformed = results.map((e) {
      return User.fromJSON(e);
    }).toList();
    return transformed;
  }
}
