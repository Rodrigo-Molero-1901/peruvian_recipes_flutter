import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/core/network/api_manager/api_manager.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/features/home/data/models/categories_list_mapper.dart';
import 'package:peruvian_recipes_flutter/features/home/data/models/category_model.dart';
import 'package:peruvian_recipes_flutter/features/home/domain/repositories/category_repository.dart';

@Injectable(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  final ApiManager _apiManager;

  CategoryRepositoryImpl({
    required ApiManager apiManager,
  }) : _apiManager = apiManager;

  @override
  Future<Either<ApiError, List<CategoryModel>>> getCategories() async {
    final categoriesResponse =
        await _apiManager.categoryApiManager.getCategories();
    return categoriesResponse.fold(
      (error) => Left(error),
      (response) => Right(categoriesListModelFromResponse(response)),
    );
  }
}
