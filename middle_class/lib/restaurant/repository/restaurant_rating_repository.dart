import 'package:dio/dio.dart' hide Headers;
import 'package:middle_class/common/model/cursor_pagination_model.dart';
import 'package:middle_class/common/model/pagination_params.dart';
import 'package:middle_class/rating/model/rating_model.dart';
import 'package:retrofit/retrofit.dart';

part 'restaurant_rating_repository.g.dart';

// restaurant/:rid/rating
@RestApi()
abstract class RestaurantRatingRepository {
  factory RestaurantRatingRepository(Dio dio, {String baseUrl}) =
      _RestaurantRatingRepository;

  @GET('/')
  @Headers({'accessToken': 'true'})
  Future<CursorPagination<RatingModel>> paginate(
      {@Queries()
      PaginationParams? paginationParams = const PaginationParams()});
}
