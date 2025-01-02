import 'package:flutter/material.dart';
import 'package:middle_class/common/const/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final ValueChanged<String> onChanged;

  const CustomTextFormField(
      {super.key,
      this.hintText,
      this.errorText,
      this.obscureText = false,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    const baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: INPUT_BORDER_COLOR,
        width: 1,
      ),
    );
    return TextField(
      cursorColor: PRIMARY_COLOR,
      obscureText: obscureText, // 비밀번호 입력 시 사용
      autofocus: false,
      onChanged: onChanged,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          hintText: hintText,
          errorText: errorText,
          hintStyle: const TextStyle(
            color: BODY_TEXT_COLOR,
            fontSize: 14,
          ),
          fillColor: INPUT_BG_COLOR,
          filled: true,
          border: baseBorder,
          focusedBorder: baseBorder.copyWith(
            borderSide: baseBorder.borderSide.copyWith(
              color: PRIMARY_COLOR,
            ),
          )),
    );
  }
}
