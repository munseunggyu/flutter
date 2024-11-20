import 'package:calender/component/calender.dart';
import 'package:calender/component/custom_text_field.dart';
import 'package:calender/component/schedule_bottom_sheet.dart';
import 'package:calender/component/schedule_card.dart';
import 'package:calender/component/today_banner.dart';
import 'package:calender/const/color.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  int taskCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) {
              return const ScheduleBottomSheet();
            },
          );
        },
        backgroundColor: primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
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
              selectedDayPredicate: selectedDayPredicate,
            ),
            TodayBanner(
              selectedDay: selectedDay,
              taskCount: taskCount,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                ),
                child: ListView(
                  children: [
                    ScheduleCard(
                      color: Colors.blue,
                      startTime: DateTime(2024, 11, 20, 11),
                      endTime: DateTime(2024, 11, 20, 12),
                      content: 'Flutter Study',
                    ),
                  ],
                ),
              ),
            ),
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
    return day.isAtSameMomentAs(selectedDay);
  }
}
