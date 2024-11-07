import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/todo_item.dart';

class Header extends StatelessWidget {
  final now = DateTime.now();
  late String formattedDate = DateFormat('yy년 MM월 dd일').format(now);
  final List<TodoItem> todoList;
  // 오늘 날짜 담는 부분과 남은 할 일 갯수
  Header({super.key, required this.todoList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formattedDate,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          '할 일 ${todoList.where((todo) => !todo.done).length.toString()}개 남음',
          style: const TextStyle(
            color: Colors.green,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
