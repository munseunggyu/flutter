import 'package:flutter/material.dart';
import 'package:layout/const/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.red,
            child: Padding(
              // padding: const EdgeInsets.all(18),
              // padding: const EdgeInsets.symmetric(
              //   vertical: 20,
              //   horizontal: 10,
              // ),
              // padding: const EdgeInsets.only(
              //   left: 4,
              //   top: 8,
              //   right: 12,
              //   bottom: 16,
              // ),
              padding: const EdgeInsets.fromLTRB(
                32,
                64,
                16,
                8,
              ),
              child: Container(
                color: Colors.blue,
                width: 150,
                height: 150,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ColumnRowPractice extends StatelessWidget {
  const ColumnRowPractice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: colors
                .map((e) => Container(
                      width: 50,
                      height: 50,
                      color: e,
                    ))
                .toList()),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: colors
                .map((e) => Container(
                      width: 50,
                      height: 50,
                      color: e,
                    ))
                .toList()),
        Container(
          width: 50,
          height: 50,
          color: Colors.green,
        ),
      ],
    );
  }
}

class FlexTest extends StatelessWidget {
  const FlexTest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: double.infinity,
      child: Column(
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              height: 50,
              width: 50,
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              width: 50,
              color: Colors.orange,
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              width: 50,
              color: Colors.yellow,
            ),
          )
        ],
      ),
    );
  }
}

class ColumnTest extends StatelessWidget {
  const ColumnTest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: colors
            .map(
              (e) => Container(
                height: 50,
                width: 50,
                color: e,
              ),
            )
            .toList(),
      ),
    );
  }
}
