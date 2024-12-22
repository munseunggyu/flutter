import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/core/configs/theme/app_colors.dart';
import 'package:movie/screens/signup.dart';
import 'package:movie/services/access_token_service.dart';
import 'package:movie/services/apis.dart';
import 'package:movie/utils/app_navigation.dart';
import 'package:reactive_button/reactive_button.dart';

class Signin extends StatelessWidget {
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  final AccessTokenService accessTokenService = Get.find<AccessTokenService>();

  Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(
          top: 100,
          right: 16,
          left: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signinText(),
            const SizedBox(
              height: 30,
            ),
            _emailFeild(),
            const SizedBox(
              height: 15,
            ),
            _passwordFeild(),
            const SizedBox(
              height: 60,
            ),
            _signinButton(),
            const SizedBox(
              height: 10,
            ),
            _signupText(context),
          ],
        ),
      ),
    );
  }

  Widget _signinText() {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Widget _emailFeild() {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(
        hintText: 'Email',
      ),
    );
  }

  Widget _passwordFeild() {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(
        hintText: 'Password',
      ),
    );
  }

  Widget _signinButton() {
    return ReactiveButton(
      activeColor: AppColors.primary,
      onPressed: () async {
        var email = _emailCon.text;
        var password = _emailCon.text;
        // AuthService.signupApi(email, password);
        var res = await Apis.instance.signin(email, password);
        if (res['success']) {
          accessTokenService.saveAccessToken(res['user']['token']);
        }
      },
      onSuccess: () {},
      onFailure: (error) {},
    );
  }

  Widget _signupText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text: "Don't you have account?",
          ),
          TextSpan(
              text: " Sign Up",
              style: const TextStyle(
                color: Colors.blue,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  AppNavigator.push(
                    context,
                    Signup(),
                  );
                }),
        ],
      ),
    );
  }
}
