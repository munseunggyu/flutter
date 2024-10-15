import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('asset/img/logo.png'),
        const SizedBox(
          height: 20,
        ),
        const CircularProgressIndicator(
          color: Colors.white,
        )
      ],
    );
  }
}
