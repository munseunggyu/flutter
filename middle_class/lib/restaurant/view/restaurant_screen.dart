import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:middle_class/common/model/cursor_pagination_model.dart';
import 'package:middle_class/restaurant/component/restaurant_card.dart';
import 'package:middle_class/restaurant/model/restaurant_model.dart';
import 'package:middle_class/restaurant/provider/restaurant_provider.dart';
import 'package:middle_class/restaurant/repository/restaurant_repository.dart';
import 'package:middle_class/restaurant/view/restaurant_detail_screen.dart';

class RestaurantScreen extends ConsumerStatefulWidget {
  const RestaurantScreen({super.key});

  @override
  ConsumerState<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends ConsumerState<RestaurantScreen> {
  final ScrollController controller = ScrollController();

  Future<CursorPagination<RestaurantModel>> paginationRestaurant(
      WidgetRef ref) async {
    final repository = await ref.watch(restaurantRepositoryProvider).paginate();

    return repository;
  }

  @override
  void initState() {
    super.initState();

    controller.addListener(scrollListener);
  }

  void scrollListener() {
    // 현재 위치가 최대 길이보다 조금 덜 된 위치까지 왔다면
    // 새로운 데이터 추가;
    if (controller.offset > controller.position.maxScrollExtent - 300) {
      ref.read(restaurantProvider.notifier).paginate(fetchMore: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(restaurantProvider);

    if (data is CusrorPaginationLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (data is CusrorPaginationError) {
      return Center(
        child: Text(data.message),
      );
    }

    // CursorPagination
    // CursorPaginationFetchingMore
    // CursorPaginationReFetching
    final cp = data as CursorPagination;
    final itemList = cp.data;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        controller: controller,
        itemCount: itemList.length + 1,
        itemBuilder: (context, index) {
          if (index == itemList.length) {
            return Center(
              child: data is CusrorPaginationFetchingMore
                  ? const CircularProgressIndicator()
                  : const Text('마지막 데이터입니다.'),
            );
          }

          final item = itemList[index];

          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => RestaurantDetailScreen(
                    id: item.id,
                  ),
                ),
              );
            },
            child: RestaurantCard.fromModel(
              model: item,
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 8,
        ),
      ),
    );
  }
}
