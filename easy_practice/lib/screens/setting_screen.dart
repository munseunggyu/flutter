import 'package:easy_practice/constant/color.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({
    super.key,
  });

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double maxNumber = 999.0;
  void goBack() {
    Navigator.of(context).pop();
  }

  void changeValue(double value) {
    setState(() {
      maxNumber = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Number(maxNumber: maxNumber),
            _Slider(maxNumber: maxNumber, changeValue: changeValue),
            _Button(goBack: goBack),
          ],
        ),
      )),
    );
  }
}

class _Slider extends StatefulWidget {
  final double maxNumber;
  final ValueChanged<double> changeValue;
  const _Slider(
      {super.key, required this.maxNumber, required this.changeValue});

  @override
  State<_Slider> createState() => _SliderState();
}

class _SliderState extends State<_Slider> {
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: widget.maxNumber,
      max: 999,
      label: widget.maxNumber.toString(),
      divisions: 100,
      min: 000,
      onChanged: widget.changeValue,
    );
  }
}

class _Number extends StatelessWidget {
  final double maxNumber;
  const _Number({super.key, required this.maxNumber});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: maxNumber.ceil().toString().split('').map((el) {
          return Image.asset(
            'asset/img/$el.png',
            width: 50,
            height: 50,
          );
        }).toList(),
      ),
    );
  }
}

class _Button extends StatefulWidget {
  final VoidCallback goBack;
  const _Button({super.key, required this.goBack});

  @override
  State<_Button> createState() => _ButtonState();
}

class _ButtonState extends State<_Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      onPressed: widget.goBack,
      child: const Text('뒤로'),
    );
  }
}
