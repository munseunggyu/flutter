import 'package:flutter/material.dart';
import 'package:middle_class/common/component/custom_text_form_field.dart';
import 'package:middle_class/user/view/login_screen.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'NotoSans',
        ),
        home: const LoginScreen());
  }
}
