import 'package:json_annotation/json_annotation.dart';

part 'cursor_pagination_model.g.dart';

abstract class CursorPaginationBase {}

class CusrorPaginationError extends CursorPaginationBase {
  final String message;

  CusrorPaginationError({
    required this.message,
  });
}

class CusrorPaginationLoading extends CursorPaginationBase {}

@JsonSerializable(genericArgumentFactories: true)
class CursorPagination<T> extends CursorPaginationBase {
  final CursorPaginationMeta meta;
  final List<T> data;

  CursorPagination({required this.data, required this.meta});

  CursorPagination copyWith({List<T>? data, CursorPaginationMeta? meta}) {
    return CursorPagination(data: data ?? this.data, meta: meta ?? this.meta);
  }

  factory CursorPagination.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CursorPaginationFromJson(json, fromJsonT);
}

@JsonSerializable()
class CursorPaginationMeta {
  final int count;
  final bool hasMore;

  CursorPaginationMeta({required this.count, required this.hasMore});

  CursorPaginationMeta copyWith({
    int? count,
    bool? hasMore,
  }) {
    return CursorPaginationMeta(
        count: count ?? this.count, hasMore: hasMore ?? this.hasMore);
  }

  factory CursorPaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$CursorPaginationMetaFromJson(json);
}

class CusrorPaginationRefetching<T> extends CursorPagination<T> {
  CusrorPaginationRefetching({required super.data, required super.meta});
}

class CusrorPaginationFetchingMore<T> extends CursorPagination<T> {
  CusrorPaginationFetchingMore({required super.data, required super.meta});
}
