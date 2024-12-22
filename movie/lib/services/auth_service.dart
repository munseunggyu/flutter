import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  var accessToken = ''.obs;

  Future<void> saveToken(String token) async {
    await storage.write(key: 'accessToken', value: token);
    accessToken.value = token;
  }

  Future<void> loadToken() async {
    accessToken.value = await storage.read(key: 'accessToken') ?? '';
  }

  @override
  void onInit() {
    super.onInit();
    loadToken(); // 앱 시작 시 토큰 로드
  }
}
