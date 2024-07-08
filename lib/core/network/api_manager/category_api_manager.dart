import 'package:fpdart/fpdart.dart';
import 'package:peruvian_recipes_flutter/core/network/api/api.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/core/network/response/categories_list_response.dart';

class CategoryApiManager {
  final Api _api;

  CategoryApiManager(this._api);

  Future<Either<ApiError, CategoriesListResponse>> getCategories() async {
    try {
      final response = await _api.categoriesApi.getCategories();
      if (response.data != null) return Right(response.data!);
      return Left(ApiError.defaultError());
    } catch (_) {
      return Left(ApiError.defaultError());
    }
  }
}
