import 'package:flutter/material.dart';

class MainStat extends StatelessWidget {
  const MainStat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const ts = TextStyle(
      color: Colors.white,
      fontSize: 40,
    );
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'Seoul',
              style: ts.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Seoul',
              style: ts.copyWith(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'asset/img/good.png',
              width: MediaQuery.of(context).size.width / 2,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Seoul',
              style: ts.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Seoul',
              style: ts.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
