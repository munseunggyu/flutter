import 'package:calender/component/custom_text_field.dart';
import 'package:calender/const/color.dart';
import 'package:calender/database/drift.dart';
import 'package:calender/model/schedule.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ScheduleBottomSheet extends StatefulWidget {
  final DateTime selectedDay;
  const ScheduleBottomSheet({super.key, required this.selectedDay});

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

typedef OnColorSelected = void Function(String color);

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  int? startTime;
  int? endTime;
  String? content;

  final GlobalKey<FormState> formKey = GlobalKey();

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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _Time(
                  onEndSaved: onEndTimeSaved,
                  onEndValidate: onEndTimeValidate,
                  onStartSaved: onStartTimeSaved,
                  onStartValidate: onStartTimeValidate,
                ),
                const SizedBox(
                  height: 8,
                ),
                _Content(
                  onSaved: onContentTimeSaved,
                  onValidate: onContentTimeValidate,
                ),
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
                _SaveButton(onPressed: onPressed),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onPressed() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    formKey.currentState!.save();
    final database = GetIt.I<AppDatabase>();
    await database.createSchedule(ScheduleTableCompanion(
      startTime: Value(startTime!),
      endTime: Value(endTime!),
      content: Value(content!),
      date: Value(widget.selectedDay),
      createdAt: Value(DateTime.now().toUtc()),
    ));

    Navigator.of(context).pop();
  }

  onStartTimeSaved(String? val) {
    if (val == null) {
      return;
    }
    startTime = int.parse(val);
  }

  String? onStartTimeValidate(String? val) {
    if (val == null) return '값을 입력해주세요.';
    if (int.tryParse(val) == null) {
      return '숫자를 입력해주세요';
    }
    return null;
  }

  onEndTimeSaved(String? val) {
    if (val == null) return;
    endTime = int.parse(val);
  }

  String? onEndTimeValidate(String? val) {
    if (val == null) return '값을 입력해주세요.';
    if (int.tryParse(val) == null) {
      return '숫자를 입력해주세요';
    }
    return null;
  }

  onContentTimeSaved(String? val) {
    if (val == null) return;
    content = val;
  }

  String? onContentTimeValidate(String? val) {
    if (val == null) return '값을 입력해주세요.';

    return null;
  }
}

class _SaveButton extends StatelessWidget {
  VoidCallback onPressed;
  _SaveButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
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
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> onValidate;
  const _Content({super.key, required this.onSaved, required this.onValidate});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextField(
        label: '내용',
        expand: true,
        onSaved: onSaved,
        validator: onValidate,
      ),
    );
  }
}

class _Time extends StatelessWidget {
  final FormFieldSetter<String> onStartSaved;
  final FormFieldSetter<String> onEndSaved;
  final FormFieldValidator<String> onStartValidate;
  final FormFieldValidator<String> onEndValidate;

  final GlobalKey<FormState> formKey = GlobalKey();

  _Time(
      {super.key,
      required this.onEndSaved,
      required this.onEndValidate,
      required this.onStartSaved,
      required this.onStartValidate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            label: '시작 시간',
            onSaved: onStartSaved,
            validator: onStartValidate,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: CustomTextField(
            label: '마감 시간',
            onSaved: onEndSaved,
            validator: onEndValidate,
          ),
        ),
      ],
    );
  }
}
