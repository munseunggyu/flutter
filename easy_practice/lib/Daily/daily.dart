import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Daily extends StatefulWidget {
  const Daily({super.key});

  @override
  State<Daily> createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        width: MediaQuery.of(context).size.width, // 앱의 화면 너비
        child: Container(
          color: Colors.blue[100],
          child: Column(
            children: [
              _Top(selectedDate: selectedDate, datePicker: datePicker),
              const _Bottom(),
            ],
          ),
        ),
      ),
    );
  }

  void datePicker() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            color: Colors.white,
            height: 300,
            child: CupertinoDatePicker(
              initialDateTime: selectedDate,
              mode: CupertinoDatePickerMode.date,
              maximumDate: DateTime.now(),
              onDateTimeChanged: (t) {
                setState(() {
                  DateTime nowDate = DateTime.now();
                  if (!t.isAfter(nowDate)) {
                    selectedDate = t;
                  }
                });
              },
              dateOrder: DatePickerDateOrder.ymd,
            ),
          ),
        );
      },
      barrierDismissible: true,
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom();

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      // child: Image.asset('asset/img/image_3.jpeg'),
      child: Text(
        'hi',
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
    );
  }
}

class _Top extends StatefulWidget {
  final DateTime selectedDate;
  final VoidCallback? datePicker;
  const _Top({required this.selectedDate, required this.datePicker});

  @override
  State<_Top> createState() => _TopState();
}

class _TopState extends State<_Top> {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return Expanded(
      child: Column(
        children: [
          Text(
            'U&I',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const Text(
            'Daily',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: 'sunflower',
            ),
          ),
          Text(
            '${widget.selectedDate.year}.${widget.selectedDate.month}.${widget.selectedDate.day}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: 'sunflower',
            ),
          ),
          IconButton(
            onPressed: widget.datePicker,
            icon: const Icon(
              Icons.date_range,
            ),
            iconSize: 60,
            color: Colors.blue,
          ),
          Text(
            'D + ${now.difference(widget.selectedDate).inDays + 1}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontFamily: 'sunflower',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
