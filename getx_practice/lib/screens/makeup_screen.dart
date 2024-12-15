import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controlls/makeup_controllder.dart';

class MakeupScreen extends StatelessWidget {
  final MakeupControllder makeupControllder = Get.put(MakeupControllder());
  MakeupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (makeupControllder.makeupList.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      return Padding(
        padding: const EdgeInsets.all(
          12,
        ),
        child: GridView.builder(
          itemBuilder: (context, index) {
            final makeupItem = makeupControllder.makeupList[index];

            return Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(
                  5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        if (makeupItem.imageLink != null)
                          Image.network(
                            makeupItem.imageLink!,
                            width: 60,
                            height: 60,
                          ),
                        Positioned(
                          top: 0,
                          left: -10,
                          child: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color:
                                  makeupItem.heart ? Colors.red : Colors.white,
                            ),
                            onPressed: () {
                              makeupControllder.changeHeart(makeupItem.id);
                            },
                          ),
                        ),
                      ],
                    ),
                    Text(
                      makeupItem.name,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Chip(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.zero,
                            label: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  makeupItem.rating.toString(),
                                  style: const TextStyle(
                                    color: Colors.white, // 텍스트 색상
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 4), // 텍스트와 아이콘 간격
                                const Icon(
                                  Icons.star, // 별 모양 아이콘
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '\$${makeupItem.price.toString()}',
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          // itemCount: makeupControllder.makeupList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 8,
          ),
        ),
      );
    });
  }
}
