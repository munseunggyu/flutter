import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:middle_class/common/const/data.dart';
import 'package:middle_class/common/layout/default_layout.dart';
import 'package:middle_class/product/component/product_card.dart';
import 'package:middle_class/restaurant/component/restaurant_card.dart';
import 'package:middle_class/restaurant/model/restaurant_detail_model.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final String id;
  const RestaurantDetailScreen({super.key, required this.id});
  final storage = const FlutterSecureStorage();

  Future<Map<String, dynamic>> getRestaruantDetail() async {
    final dio = Dio();
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final resp = await dio.get('$ip/restaurant/$id',
        options: Options(headers: {'authorization': 'Bearer $accessToken'}));

    return resp.data;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '불',
      child: FutureBuilder<Map<String, dynamic>>(
          future: getRestaruantDetail(),
          builder: (_, AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final item = RestaurantDetailModel.fromJson(snapshot.data!);

            return CustomScrollView(
              slivers: [
                renderTop(model: item),
                renderLabel(),
                renderProducts(model: item.products),
              ],
            );
          }),
    );
  }

  SliverPadding renderLabel() {
    return const SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: Text(
          '메뉴',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  SliverPadding renderProducts({required List<RestaurantProductModel> model}) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final item = model[index];
          return Padding(
            padding: const EdgeInsets.only(top: 4),
            // child: Text('data'),
            child: ProductCard(
                image: Image.network(
                  '$ip${item.imgUrl}',
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                ),
                name: item.name,
                detail: item.detail,
                price: item.price),
          );
        }, childCount: 10),
      ),
    );
  }

  SliverToBoxAdapter renderTop({
    required RestaurantDetailModel model,
  }) {
    return SliverToBoxAdapter(
        child: RestaurantCard.fromModel(
      model: model,
      isDetail: true,
    ));
  }
}
