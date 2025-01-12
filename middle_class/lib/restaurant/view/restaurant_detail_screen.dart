import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:middle_class/common/const/data.dart';
import 'package:middle_class/common/dio/dio.dart';
import 'package:middle_class/common/layout/default_layout.dart';
import 'package:middle_class/product/component/product_card.dart';
import 'package:middle_class/restaurant/component/restaurant_card.dart';
import 'package:middle_class/restaurant/model/restaurant_detail_model.dart';
import 'package:middle_class/restaurant/model/restaurant_model.dart';
import 'package:middle_class/restaurant/provider/restaurant_provider.dart';
import 'package:middle_class/restaurant/repository/restaurant_repository.dart';

class RestaurantDetailScreen extends ConsumerStatefulWidget {
  final String id;
  const RestaurantDetailScreen({super.key, required this.id});

  @override
  ConsumerState<RestaurantDetailScreen> createState() =>
      _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState
    extends ConsumerState<RestaurantDetailScreen> {
  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();

    ref.read(restaurantProvider.notifier).getDetail(id: widget.id);
  }

  Future<RestaurantDetailModel> getRestaruantDetail(WidgetRef ref) async {
    final respository = ref.watch(restaurantRepositoryProvider);

    return respository.getRestaurantDetail(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final item = ref.watch(restaurantDetailProvider(widget.id));

    if (item == null) {
      return const DefaultLayout(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return DefaultLayout(
        title: '불',
        child: CustomScrollView(
          slivers: [
            renderTop(model: item),
            if (item is RestaurantDetailModel) renderLabel(),
            if (item is RestaurantDetailModel)
              renderProducts(model: item.products),
          ],
        ));
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
        }, childCount: model.length),
      ),
    );
  }

  SliverToBoxAdapter renderTop({
    required RestaurantModel model,
  }) {
    return SliverToBoxAdapter(
        child: RestaurantCard.fromModel(
      model: model,
      isDetail: true,
    ));
  }
}
