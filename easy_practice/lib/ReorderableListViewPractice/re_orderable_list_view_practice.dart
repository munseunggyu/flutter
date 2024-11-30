import 'package:easy_practice/constant/color.dart';
import 'package:easy_practice/layout/main_layout.dart';
import 'package:flutter/material.dart';

class ReOrderableListViewPractice extends StatefulWidget {
  const ReOrderableListViewPractice({super.key});

  @override
  State<ReOrderableListViewPractice> createState() =>
      _ReOrderableListViewPracticeState();
}

class _ReOrderableListViewPracticeState
    extends State<ReOrderableListViewPractice> {
  final List<int> numbers = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'ReorderableListViewScreen',
        children: ReorderableListView.builder(
          itemBuilder: (context, index) {
            return renderContainer(
                color: rainbowColors[numbers[index] % rainbowColors.length],
                index: numbers[index]);
          },
          itemCount: numbers.length,
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (oldIndex > newIndex) {
                final item = numbers.removeAt(oldIndex);
                numbers.insert(newIndex, item);
              } else {
                final item = numbers.removeAt(oldIndex);
                numbers.insert(newIndex - 1, item);
              }
            });
          },
        ));
  }

  Widget simpleReorder() {
    return ReorderableListView(
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex > newIndex) {
            final item = numbers.removeAt(oldIndex);
            numbers.insert(newIndex, item);
          } else {
            final item = numbers.removeAt(oldIndex);
            numbers.insert(newIndex - 1, item);
          }
        });
      },
      children: numbers
          .map((e) => renderContainer(
              color: rainbowColors[e % rainbowColors.length], index: e))
          .toList(),
    );
  }

  Widget renderContainer({required Color color, int? index}) {
    print(index);
    return Container(
      key: Key(index.toString()),
      height: 300,
      color: color,
      child: Text(index.toString()),
    );
  }
}
