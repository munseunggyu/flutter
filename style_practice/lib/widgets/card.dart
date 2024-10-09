import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final Color bgColor;
  final Color txtColor;
  final String txt1;
  final String txt2;
  final String txt3;
  final Icon icon;

  const CardComponent({
    super.key,
    required this.bgColor,
    required this.txtColor,
    required this.txt1,
    required this.txt2,
    required this.txt3,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txt1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      txt2,
                      style: TextStyle(
                        color: txtColor,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      txt3,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                      ),
                    )
                  ],
                )
              ],
            ),
            Transform.scale(
              scale: 2.3,
              child:
                  Transform.translate(offset: const Offset(6, 8), child: icon),
            ),
          ],
        ),
      ),
    );
  }
}
