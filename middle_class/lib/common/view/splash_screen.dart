import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:middle_class/common/const/colors.dart';
import 'package:middle_class/common/const/data.dart';
import 'package:middle_class/common/layout/default_layout.dart';
import 'package:middle_class/common/view/root_tab.dart';
import 'package:middle_class/user/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = const FlutterSecureStorage();

  final dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkToken();
  }

  void checkToken() async {
    String? accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    String? refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);

    if (refreshToken == null || accessToken == null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false,
      );
      return;
    }

    try {
      final resp = await dio.post('$ip/auth/token',
          options: Options(headers: {'authorization': 'Bearer $refreshToken'}));

      await storage.write(
          key: ACCESS_TOKEN_KEY, value: resp.data['accessToken']);
      await storage.write(
          key: REFRESH_TOKEN_KEY, value: resp.data['refreshToken']);

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const RootTab()),
        (route) => false,
      );
    } catch (err) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false,
      );
      return;
    }
  }

  void deleteToken() async {
    await storage.deleteAll();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/img/logo/logo.png',
              width: MediaQuery.of(context).size.width / 2,
            ),
            const SizedBox(
              height: 16,
            ),
            const CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}