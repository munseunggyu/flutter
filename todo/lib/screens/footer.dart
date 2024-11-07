import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  final String input;
  void Function(String) changeInput;
  final VoidCallback addTodoList;

  Footer(
      {super.key,
      required this.input,
      required this.changeInput,
      required this.addTodoList});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          flex: 7,
          child: TextField(
            onChanged: widget.changeInput,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
          onPressed: () {
            widget.addTodoList();
            setState(() {
              myController.clear();
            });
          },
          child: const Text(
            '추가',
          ),
        )
      ],
    );
  }
}
