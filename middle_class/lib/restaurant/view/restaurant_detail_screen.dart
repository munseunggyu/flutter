import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:middle_class/common/const/data.dart';
import 'package:middle_class/common/layout/default_layout.dart';
import 'package:middle_class/product/component/product_card.dart';
import 'package:middle_class/rating/component/rating_card.dart';
import 'package:middle_class/restaurant/component/restaurant_card.dart';
import 'package:middle_class/restaurant/model/restaurant_detail_model.dart';
import 'package:middle_class/restaurant/model/restaurant_model.dart';
import 'package:middle_class/restaurant/model/thumb_model.dart';
import 'package:middle_class/restaurant/provider/restaurant_provider.dart';
import 'package:middle_class/restaurant/provider/thumb_provider.dart';
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
  late ThumbModel? thumb;

  @override
  void initState() {
    super.initState();
    print(widget.id);
    ref.read(restaurantProvider.notifier).getDetail(id: widget.id);
  }

  Future<RestaurantDetailModel> getRestaruantDetail(WidgetRef ref) async {
    final respository = ref.watch(restaurantRepositoryProvider);

    return respository.getRestaurantDetail(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final item = ref.watch(restaurantDetailProvider(widget.id));

    final thumbState = ref.watch(thumbListPrivider);

    final gthumbState = ref.watch(gThumbStateNotifierProvider);

    if (item == null) {
      return const DefaultLayout(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    thumb = gthumbState.where(
      (element) {
        return element.id == item.id;
      },
    ).firstOrNull;
    return DefaultLayout(
        title: '불',
        child: CustomScrollView(
          slivers: [
            renderTop(model: item),
            if (thumb != null)
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                sliver: SliverToBoxAdapter(
                  child: GestureDetector(
                    onDoubleTap: () {
                      if (thumb != null) {
                        ref
                            .read(gThumbStateNotifierProvider.notifier)
                            .handleUpThumb(item.id);
                      }
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.thumb_up),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(thumb!.count.toString()),
                      ],
                    ),
                  ),
                ),
              ),
            if (item is RestaurantDetailModel) renderLabel(),
            if (item is RestaurantDetailModel)
              renderProducts(model: item.products),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              sliver: SliverToBoxAdapter(
                child: RatingCard(
                  email: 'wow',
                  images: [],
                  avatarImage: AssetImage(
                    'asset/img/logo/codefactory_logo.png',
                  ),
                  rating: 2,
                  content: 'dnakdl',
                ),
              ),
            )
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
