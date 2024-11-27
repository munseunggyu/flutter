import 'package:calender/component/calender.dart';
import 'package:calender/component/custom_text_field.dart';
import 'package:calender/component/schedule_bottom_sheet.dart';
import 'package:calender/component/schedule_card.dart';
import 'package:calender/component/today_banner.dart';
import 'package:calender/const/color.dart';
import 'package:calender/database/drift.dart';
import 'package:calender/model/schedule.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
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
        onPressed: () async {
          final schedule = await showModalBottomSheet(
            context: context,
            builder: (_) {
              return ScheduleBottomSheet(selectedDay: selectedDay);
            },
          );
          if (schedule == null) {
            return;
          }

          setState(() {
            schedules = {
              ...schedules,
              schedule.date: [
                if (schedules.containsKey(schedule.date))
                  ...schedules[schedule.date]!,
                schedule
              ]
            };
          });
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
                  child: FutureBuilder<List<ScheduleTableData>>(
                    future: GetIt.I<AppDatabase>().getSchedules(selectedDay),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      }
                      if (!snapshot.hasData &&
                          snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: Text('loading...'),
                        );
                      }

                      final schedules = snapshot.data!;
                      final selectedSchedules = schedules.where((e) {
                        return e.date.isAtSameMomentAs(selectedDay);
                      }).toList();

                      return ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 8,
                          );
                        },
                        itemCount: selectedSchedules.length,
                        itemBuilder: (BuildContext context, int index) {
                          final schedule = selectedSchedules[index];

                          return ScheduleCard(
                              color: Color(
                                int.parse(
                                  'FF${schedule.color}',
                                  radix: 16,
                                ),
                              ),
                              content: schedule.content,
                              endTime: schedule.endTime,
                              startTime: schedule.startTime);
                        },
                      );
                    },
                  )),
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

  onSavePressed() {}
}
