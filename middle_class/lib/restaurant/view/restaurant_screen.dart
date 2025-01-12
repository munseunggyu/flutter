import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:middle_class/common/const/data.dart';
import 'package:middle_class/common/dio/dio.dart';
import 'package:middle_class/restaurant/component/restaurant_card.dart';
import 'package:middle_class/restaurant/model/restaurant_model.dart';
import 'package:middle_class/restaurant/repository/restaurant_repository.dart';
import 'package:middle_class/restaurant/view/restaurant_detail_screen.dart';

class RestaurantScreen extends ConsumerWidget {
  const RestaurantScreen({super.key});
  final storage = const FlutterSecureStorage();

  Future<List<RestaurantModel>> paginationRestaurant(WidgetRef ref) async {
    // final dio = Dio();

    // dio.interceptors.add(CustomInterceptor(storage: storage));
    final dio = ref.watch(dioProvider);

    final respository =
        await RestaurantRepository(dio, baseUrl: '$ip/restaurant').paginate();

    return respository.data;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FutureBuilder<List<RestaurantModel>>(
              future: paginationRestaurant(ref),
              builder:
                  (context, AsyncSnapshot<List<RestaurantModel>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final item = snapshot.data![index];

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
