import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:middle_class/common/const/data.dart';
import 'package:middle_class/common/dio/dio.dart';
import 'package:middle_class/common/model/cursor_pagination_model.dart';
import 'package:middle_class/restaurant/component/restaurant_card.dart';
import 'package:middle_class/restaurant/model/restaurant_model.dart';
import 'package:middle_class/restaurant/repository/restaurant_repository.dart';
import 'package:middle_class/restaurant/view/restaurant_detail_screen.dart';

class RestaurantScreen extends ConsumerWidget {
  const RestaurantScreen({super.key});
  final storage = const FlutterSecureStorage();

  Future<CursorPagination<RestaurantModel>> paginationRestaurant(
      WidgetRef ref) async {
    final repository = await ref.watch(restaurantRepositoryProvider).paginate();

    return repository;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FutureBuilder<CursorPagination<RestaurantModel>>(
              future: paginationRestaurant(ref),
              builder: (context,
                  AsyncSnapshot<CursorPagination<RestaurantModel>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.separated(
                  itemCount: snapshot.data!.data.length,
                  itemBuilder: (context, index) {
                    final item = snapshot.data!.data[index];

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
                );
              }),
        ),
      ),
    );
  }
}
