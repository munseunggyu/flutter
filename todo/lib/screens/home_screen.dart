import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/screens/add_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> todoList = [];

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
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.startToEnd,
            background: Container(
              color: Colors.red,
              child: const Row(
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            onDismissed: (direction) {
              removeTodo(index);
            },
            child: ListTile(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          removeTodo(index);
                        },
                        child: const Text('Task done!'),
                      ),
                    );
                  },
                );
              },
              title: Text(todoList[index]),
            ),
          );
        },
        itemCount: todoList.length,
      ),
    );
  }
}
