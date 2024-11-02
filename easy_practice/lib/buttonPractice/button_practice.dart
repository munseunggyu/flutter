import 'package:flutter/material.dart';

class ButtonsPracitce extends StatelessWidget {
  const ButtonsPracitce({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  // 배경색
                  backgroundColor: Colors.red,
                  disabledBackgroundColor: Colors.grey,
                  // 배경 위의 색상
                  foregroundColor: Colors.white,
                  shadowColor: Colors.green,
                  elevation: 10,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 23,
                  ),
                  padding: const EdgeInsets.all(
                    12,
                  ),
                  side: const BorderSide(
                    color: Colors.black,
                    width: 3,
                  ),
                  // minimumSize: const Size(
                  //   320,
                  //   100,
                  // ),
                  // fixedSize: const Size(
                  //   120,
                  //   100,
                  // ),
                ),
                child: const Text(
                  'ElevatedButton',
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                // Material State
                // hovered, focused, pressed, disabled, dragged, selected, disabled, error
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Colors.red,
                  ),
                ),
                child: const Text(
                  'OutlinedButton',
                ),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.pressed)) {
                      return Colors.red;
                    }
                    return Colors.grey;
                  }),
                ),
                child: const Text(
                  'TextButton',
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  // shape: const StadiumBorder(),
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(
                  //     8,
                  //   ),
                  // ),
                  shape: const CircleBorder(
                    eccentricity: 0,
                  ),
                ),
                child: const Text(
                  'OutlinedButton Shape',
                ),
              ),
              ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text('Icons with'),
                  icon: const Icon(
                    Icons.access_time,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
