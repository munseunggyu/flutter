import 'package:dio/dio.dart';

class Apis {
  static final Apis instance = Apis._internal();
  factory Apis() => instance;
  Apis._internal() {
    final options = BaseOptions(
      baseUrl: 'https://netflix-backend-production-8413.up.railway.app/api/v1',
      // /auth/signup
      headers: {
        'Content-Type': 'application/json',
      },
      followRedirects: false,
      validateStatus: (status) =>
          (status == null || status < 500) ? true : false,
    );
    _dio = Dio(options);
  }

  late final Dio _dio;

  Future<dynamic> signup(String email, String password) {
    final res =
        _dio.post('/auth/signup', data: {'email': email, 'password': password});

    return res;
  }

  Future<dynamic> signin(String email, String password) async {
    final res = await _dio
        .post('/auth/signin', data: {'email': email, 'password': password});

    return res.data;
  }
}
