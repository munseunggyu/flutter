import 'package:easy_practice/riverpod/listen_provider.dart';
import 'package:easy_practice/riverpod_practice/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodListenScreen extends ConsumerStatefulWidget {
  const RiverpodListenScreen({super.key});

  @override
  ConsumerState<RiverpodListenScreen> createState() =>
      _RiverpodListenScreenState();
}

class _RiverpodListenScreenState extends ConsumerState<RiverpodListenScreen>
    with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    controller = TabController(
      length: 10,
      vsync: this,
      initialIndex: ref.read(listenProvider),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(listenProvider, (previos, next) {
      controller.animateTo(next);
    });
    return DefaultLayout(
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: List.generate(
            10,
            (index) => Column(
              children: [
                ElevatedButton(
                  child: const Text('prev'),
                  onPressed: () {
                    ref
                        .read(listenProvider.notifier)
                        .update((state) => state == 0 ? 0 : state - 1);
                  },
                ),
                Text(index.toString()),
                ElevatedButton(
                  child: const Text('다음'),
                  onPressed: () {
                    ref
                        .read(listenProvider.notifier)
                        .update((state) => state == 10 ? 10 : state + 1);
                  },
                ),
              ],
            ),
          ),
        ),
        title: 'RiverpodListenScreen');
  }
}
