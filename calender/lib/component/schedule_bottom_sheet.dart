import 'package:calender/component/custom_text_field.dart';
import 'package:calender/const/color.dart';
import 'package:flutter/material.dart';

class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({
    super.key,
  });

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

typedef OnColorSelected = void Function(String color);

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  String selectedColor = categoryColors.first;

  void changeColor(String color) {
    setState(() {
      selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            16,
          ),
          child: Column(
            children: [
              const _Time(),
              const SizedBox(
                height: 8,
              ),
              const _Content(),
              const SizedBox(
                height: 8,
              ),
              _Categories(
                selectedColor: selectedColor,
                onTap: changeColor,
              ),
              const SizedBox(
                height: 8,
              ),
              const _SaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
            ),
            child: const Text(
              '저장',
            ),
          ),
        ),
      ],
    );
  }
}

class _Categories extends StatelessWidget {
  String selectedColor = categoryColors.first;
  OnColorSelected onTap;
  _Categories({super.key, required this.selectedColor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: categoryColors.map((toElement) {
        return Padding(
          padding: const EdgeInsets.only(
            right: 8,
          ),
          child: GestureDetector(
            onTap: () {
              onTap(toElement);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(
                  int.parse(
                    'FF$toElement',
                    radix: 16,
                  ),
                ),
                border: toElement == selectedColor
                    ? Border.all(
                        color: Colors.black,
                        width: 4,
                      )
                    : null,
                shape: BoxShape.circle,
              ),
              width: 32,
              height: 32,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: CustomTextField(
        label: '내용',
        expand: true,
      ),
    );
  }
}

class _Time extends StatelessWidget {
  const _Time({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: CustomTextField(
            label: '시작 시간',
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: CustomTextField(
            label: '마감 시간',
          ),
        ),
      ],
    );
  }
}
