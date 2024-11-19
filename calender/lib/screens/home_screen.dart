import 'package:calender/component/calender.dart';
import 'package:calender/const/color.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Calender(
                focusedDay: DateTime(
                  2024,
                  11,
                  19,
                ),
                onDaySelected: onDaySelected,
                selectedDayPredicate: selectedDayPredicate),
          ],
        ),
      ),
    );
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
    });
  }

  bool selectedDayPredicate(DateTime day) {
    if (selectedDay != null) {
      return day.isAtSameMomentAs(selectedDay!);
    }
    return false;
  }
}
