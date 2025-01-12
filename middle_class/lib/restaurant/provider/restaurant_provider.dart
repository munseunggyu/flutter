import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:middle_class/common/model/cursor_pagination_model.dart';
import 'package:middle_class/common/model/pagination_params.dart';
import 'package:middle_class/restaurant/model/restaurant_model.dart';
import 'package:middle_class/restaurant/repository/restaurant_repository.dart';

final restaurantDetailProvider =
    Provider.family<RestaurantModel?, String>((ref, id) {
  final state = ref.watch(restaurantProvider);

  if (state is! CursorPagination) {
    return null;
  }

  return state.data.firstWhere((e) => e.id == id);
});

final restaurantProvider =
    StateNotifierProvider<RestaurantStateNotifier, CursorPaginationBase>((ref) {
  final repository = ref.watch(restaurantRepositoryProvider);
  final notifier = RestaurantStateNotifier(repository: repository);

  return notifier;
});

class RestaurantStateNotifier extends StateNotifier<CursorPaginationBase> {
  final RestaurantRepository repository;

  RestaurantStateNotifier({required this.repository})
      : super(CusrorPaginationLoading()) {
    // 인스턴스가 생성이 되면 자동 실행
    paginate();
  }

  Future<void> paginate({
    int fetchCount = 20,
    bool fetchMore = false,
    bool foreRefetch = false,
  }) async {
    try {
      // 1) CursorPagination 정삭적으로 데이터가 있는 상태
      // 2) CursorPaginationLoading - 데이터가 로딩중인 상태
      // 3) CursorPaginationError - 데이터가 에러 상태
      // 4) CursorPaginationRefetch - 다시 데이터 가져올 때
      // 5) CursorPaginationFetchMore - 데이터 추가 가져올 때

      // 1) hasMore = false일 때(기존 상태에서 이미 다음 데이터가 없다고할 때);
      if (state is CursorPagination && !foreRefetch) {
        final pState = state as CursorPagination;

        if (!pState.meta.hasMore) {
          return;
        }
      }

      final isLoading = state is CusrorPaginationLoading;
      final isRefetching = state is CusrorPaginationRefetching;
      final isFetchingMore = state is CusrorPaginationFetchingMore;

      if (fetchMore && (isLoading || isFetchingMore || isRefetching)) {
        return;
      }
      PaginationParams paginationsParams = PaginationParams(count: fetchCount);

      // fetchMore = true - 데이터를 추가로 더 가져오는 상황
      if (fetchMore) {
        final pState = (state as CursorPagination);
        state =
            CusrorPaginationFetchingMore(data: pState.data, meta: pState.meta);

        paginationsParams =
            paginationsParams.copyWith(after: pState.data.last.id);
      } else {
        // 데이터를 처음부터 가져오는 상황
        // 새로고침 중...
        if (state is CursorPagination && !foreRefetch) {
          final pState = state as CursorPagination;
          state =
              CusrorPaginationRefetching(data: pState.data, meta: pState.meta);
        } else {
          state = CusrorPaginationLoading();
        }
      }
      final resp =
          await repository.paginate(paginationsParams: paginationsParams);

      if (state is CusrorPaginationFetchingMore) {
        final pState = state as CusrorPaginationFetchingMore;

        state = resp.copyWith(data: [...pState.data, ...resp.data]);
      } else {
        state = resp;
      }
    } catch (err) {
      state = CusrorPaginationError(message: '데이터를 가져오지 못 했습니다.');
    }
  }

  void getDetail({required String id}) async {
    // 만약에 데이터가 하나도 없는 상태라면
    if (state is! CursorPagination) {
      await paginate();
    }

    if (state is! CursorPagination) {
      return;
    }

    final pState = state as CursorPagination;
    final resp = await repository.getRestaurantDetail(id: id);
    state = pState.copyWith(
      data: pState.data
          .map<RestaurantModel>((e) => e.id == id ? resp : e)
          .toList(),
    );
  }
}
