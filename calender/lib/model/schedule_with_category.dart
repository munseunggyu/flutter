import 'package:calender/database/drift.dart';
import 'package:calender/model/category.dart';
import 'package:calender/model/schedule.dart';

class ScheduleWithCategory {
  final CategoryTableData category;
  final ScheduleTableData schedule;

  ScheduleWithCategory({
    required this.category,
    required this.schedule,
  });
}
