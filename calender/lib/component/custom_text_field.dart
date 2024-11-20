import 'package:calender/const/color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool expand;
  const CustomTextField({super.key, required this.label, this.expand = false});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        label,
        style: const TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      expand ? Expanded(child: renderTextFormField()) : renderTextFormField()
    ]);
  }

  renderTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[300],
      ),
      maxLines: expand ? null : 1,
      minLines: expand ? null : 1,
      expands: expand,
    );
  }
}
