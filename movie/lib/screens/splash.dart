import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/core/configs/assets/app_images.dart';
import 'package:movie/screens/home_screen.dart';
import 'package:movie/screens/signin.dart';
import 'package:movie/services/access_token_service.dart';
import 'package:movie/utils/app_navigation.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final AccessTokenService accessTokenService = Get.find<AccessTokenService>();

  var isSign = false;

  @override
  void initState() {
    moveRoute();
    super.initState();
  }

  Future<void> moveRoute() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (accessTokenService.isLoggedIn()) {
        AppNavigator.pushReplacement(context, const HomeScreen());
      } else {
        AppNavigator.pushReplacement(context, Signin());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppImages.splashBackground,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                const Color(
                  0xff1A1B20,
                ).withOpacity(0),
                const Color(
                  0xff1A1B20,
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
