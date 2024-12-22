import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/configs/theme/app_colors.dart';
import 'package:movie/screens/signin.dart';
import 'package:movie/services/apis.dart';
import 'package:movie/services/auth_service.dart';
import 'package:movie/utils/app_navigation.dart';
import 'package:reactive_button/reactive_button.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

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
            _signupText(),
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
            _signupButton(),
            const SizedBox(
              height: 10,
            ),
            _signinText(context),
          ],
        ),
      ),
    );
  }

  Widget _signupText() {
    return const Text(
      'Sign Up',
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

  Widget _signupButton() {
    return ReactiveButton(
      activeColor: AppColors.primary,
      onPressed: () async {
        var email = _emailCon.text;
        var password = _emailCon.text;
        // AuthService.signupApi(email, password);
        var res = await Apis.instance.signup(email, password);

        print(res);
      },
      onSuccess: () {},
      onFailure: (error) {},
    );
  }

  Widget _signinText(BuildContext context) {
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
                    Signin(),
                  );
                }),
        ],
      ),
    );
  }
}
