import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Daily extends StatefulWidget {
  const Daily({super.key});

  @override
  State<Daily> createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        width: MediaQuery.of(context).size.width, // 앱의 화면 너비
        child: Container(
          color: Colors.pink[100],
          child: const Column(
            children: [
              _Top(),
              _Bottom(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset('asset/img/middle_image.png'),
    );
  }
}

class _Top extends StatefulWidget {
  const _Top({
    super.key,
  });

  @override
  State<_Top> createState() => _TopState();
}

class _TopState extends State<_Top> {
  DateTime selectedDate = DateTime.now();

  void datePicker(context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            color: Colors.white,
            height: 300,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (t) {
                setState(() {
                  selectedDate = t;
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
            '우리 처음 만난날',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: 'sunflower',
            ),
          ),
          Text(
            '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: 'sunflower',
            ),
          ),
          IconButton(
            onPressed: () {
              datePicker(context);
            },
            icon: const Icon(
              Icons.favorite,
            ),
            iconSize: 60,
            color: Colors.red,
          ),
          Text(
            'D + ${now.difference(selectedDate).inDays + 1}',
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
