import 'package:flutter/material.dart';
import 'package:todo/models/todo_item.dart';
import 'package:todo/screens/body.dart';
import 'package:todo/screens/footer.dart';
import 'package:todo/screens/header.dart';

// header 날짜 할일 갯수
// body list 노출, check로 완료 표기, 삭제
// footer input 영역 추가

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int id = 0;
  List<TodoItem> todoList = [];
  String input = '';

  void changeInput(String value) {
    setState(() {
      input = value;
    });
  }

  void addTodoList() {
    print('object');
    setState(() {
      TodoItem newItem = TodoItem(id: id, txt: input, done: false);
      todoList.add(newItem);
      id += 1;
      input = '';
    });
  }

  void todoDone(bool value, int id) {
    setState(() {
      todoList = todoList.map((el) {
        if (el.id == id) {
          return TodoItem(id: el.id, txt: el.txt, done: value);
        }
        return el;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Header(todoList: todoList),
          Footer(
            input: input,
            changeInput: changeInput,
            addTodoList: addTodoList,
          ),
          const SizedBox(
            height: 30,
          ),
          Body(
            todoList: todoList,
            todoDone: todoDone,
          ),
        ],
      ),
    );
  }
}
