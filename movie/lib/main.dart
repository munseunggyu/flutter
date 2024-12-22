import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie/core/configs/theme/app_theme.dart';
import 'package:movie/screens/splash.dart';
import 'package:movie/service_locator.dart';
import 'package:get/get.dart';
import 'package:movie/services/access_token_service.dart';
import 'package:movie/services/auth_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  Get.put(AccessTokenService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // 상태바 색상
    ));
    return MaterialApp(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}
