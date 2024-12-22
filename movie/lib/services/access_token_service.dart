import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AccessTokenService extends GetxService {
  // 보안 저장소 인스턴스
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Observable 상태 관리 (UI 반응형 업데이트 지원)
  var accessToken = ''.obs;

  // AccessToken 저장
  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: 'accessToken', value: token);
    accessToken.value = token; // 상태 업데이트
  }

  // AccessToken 가져오기
  Future<void> loadAccessToken() async {
    final token = await _storage.read(key: 'accessToken');
    accessToken.value = token ?? ''; // 상태 초기화
  }

  // AccessToken 삭제
  Future<void> deleteAccessToken() async {
    await _storage.delete(key: 'accessToken');
    accessToken.value = ''; // 상태 초기화
  }

  // 로그인 상태 확인
  bool isLoggedIn() => accessToken.value.isNotEmpty;

  // 서비스 초기화 (앱 시작 시 실행)
  @override
  void onInit() {
    super.onInit();
    loadAccessToken(); // 저장된 토큰 로드
  }
}
