import 'package:flutter/material.dart';
import 'package:todo/models/todo_item.dart';

class Body extends StatefulWidget {
  final List<TodoItem> todoList;
  final void Function(bool, int) todoDone;
  const Body({super.key, required this.todoList, required this.todoDone});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.todoList.map((toElement) {
        return Row(
          children: [
            Checkbox(
              value: toElement.done,
              onChanged: (value) {
                widget.todoDone(value!, toElement.id);
              },
            ),
            Text(
              toElement.txt,
              style: TextStyle(
                decoration: toElement.done
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
