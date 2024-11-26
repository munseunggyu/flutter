import 'package:calender/component/calender.dart';
import 'package:calender/component/custom_text_field.dart';
import 'package:calender/component/schedule_bottom_sheet.dart';
import 'package:calender/component/schedule_card.dart';
import 'package:calender/component/today_banner.dart';
import 'package:calender/const/color.dart';
import 'package:calender/model/schedule.dart';
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

  Map<DateTime, List<Schedule>> schedules = {
    DateTime.utc(2024, 11, 20): [
      Schedule(
        id: 1,
        startTime: 11,
        endTime: 12,
        content: 'content',
        date: DateTime.utc(
          2024,
          11,
          20,
        ),
        color: categoryColors[0],
        createdAt: DateTime.now().toUtc(),
      ),
      Schedule(
        id: 1,
        startTime: 14,
        endTime: 16,
        content: 'Flutter',
        date: DateTime.utc(
          2024,
          11,
          20,
        ),
        color: categoryColors[2],
        createdAt: DateTime.now().toUtc(),
      ),
    ]
  };

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
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 8,
                      );
                    },
                    itemCount: schedules.containsKey(selectedDay)
                        ? schedules[selectedDay]!.length
                        : 0,
                    itemBuilder: (BuildContext context, int index) {
                      final scheduleModel = schedules[selectedDay]![index];

                      return ScheduleCard(
                          color: Color(
                            int.parse(
                              'FF${scheduleModel.color}',
                              radix: 16,
                            ),
                          ),
                          content: scheduleModel.content,
                          endTime: scheduleModel.endTime,
                          startTime: scheduleModel.startTime);
                    },
                  )
                  // ListView(
                  //   children:
                  // children: schedules.containsKey(selectedDay)
                  //     ? schedules[selectedDay]!
                  //         .map((e) => ScheduleCard(
                  //               color: Color(
                  //                 int.parse(
                  //                   'FF${e.color}',
                  //                   radix: 16,
                  //                 ),
                  //               ),
                  //               startTime: e.startTime,
                  //               endTime: e.endTime,
                  //               content: e.content,
                  //             ))
                  //         .toList()
                  //     : []
                  // [
                  // ScheduleCard(
                  //   color: Colors.blue,
                  //   startTime: DateTime(2024, 11, 20, 11),
                  //   endTime: DateTime(2024, 11, 20, 12),
                  //   content: 'Flutter Study',
                  // ),
                  // ],
                  // ),
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
