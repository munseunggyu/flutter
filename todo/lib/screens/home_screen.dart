import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/models/user.dart';
import 'package:todo/screens/add_task.dart';
import 'package:http/http.dart' as http;
import 'package:todo/screens/user_screen.dart';
import 'package:todo/services/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> todoList = [];
  List<User> users = [];

  void addTodo({required String todoText}) {
    if (todoList.contains(todoText)) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('이미 존재함'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('close'),
                ),
              ],
            );
          });
      return;
    }
    setState(() {
      todoList.insert(0, todoText);
      writeLocalData();
      Navigator.pop(context);
    });
  }

  void removeTodo(int index) {
    setState(() {
      todoList.removeAt(index);
      writeLocalData();
      if (Navigator.of(context).canPop()) {
        Navigator.pop(context);
      }
    });
  }

  void writeLocalData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('item', todoList);
  }

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> items = (prefs.getStringList('item') ?? []).toList();

    setState(() {
      todoList = items;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUser();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: Text('data'),
      ),
      appBar: AppBar(
        title: const Text('TODO App'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: SizedBox(
                      height: 250,
                      child: AddTask(
                        addTodo: addTodo,
                      ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: users.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : UserView(users: users),
    );
  }

  fetchUser() async {
    final response = await UserApi.fetchUser();
    setState(() {
      users = response;
    });
  }
}
