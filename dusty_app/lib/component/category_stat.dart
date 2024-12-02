import 'package:dusty_app/const/color.dart';
import 'package:flutter/material.dart';

class CategoryStat extends StatelessWidget {
  const CategoryStat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          child: LayoutBuilder(builder: (context, constraint) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: darkColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      '종류별 통계',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: lightColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        16,
                        (index) => SizedBox(
                          width: constraint.maxWidth / 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'data',
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Image.asset(
                                'asset/img/bad.png',
                                width: 50,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'data',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}

// class _Item extends StatelessWidget {
//   const _Item({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }
