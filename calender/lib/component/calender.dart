import 'package:calender/const/color.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  final DateTime focusedDay;
  OnDaySelected onDaySelected;
  final bool Function(DateTime day) selectedDayPredicate;
  Calender({
    super.key,
    required this.focusedDay,
    required this.onDaySelected,
    required this.selectedDayPredicate,
  });

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  final defaultBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(
      6,
    ),
    border: Border.all(
      color: Colors.grey[200]!,
      width: 1,
    ),
  );
  final defaultTextStyle =
      TextStyle(color: Colors.grey[600]!, fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: widget.focusedDay,
      firstDay: DateTime(
        1800,
      ),
      lastDay: DateTime(
        2025,
      ),
      onDaySelected: widget.onDaySelected,
      selectedDayPredicate: widget.selectedDayPredicate,
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      calendarStyle: CalendarStyle(
        isTodayHighlighted: true,
        defaultDecoration: defaultBoxDecoration,
        weekendDecoration: defaultBoxDecoration,
        selectedDecoration: defaultBoxDecoration.copyWith(
          border: Border.all(
            color: primaryColor,
            width: 1,
          ),
        ),
        todayDecoration: defaultBoxDecoration.copyWith(
          color: primaryColor,
        ),
        outsideDecoration: defaultBoxDecoration.copyWith(
          border: Border.all(
            color: Colors.transparent,
          ),
        ),
        defaultTextStyle: defaultTextStyle,
        weekendTextStyle: defaultTextStyle,
        selectedTextStyle: defaultTextStyle.copyWith(
          color: primaryColor,
        ),
      ),
    );
  }
}
