import 'package:fpdart/fpdart.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/features/home/data/models/category_model.dart';

abstract class CategoryRepository {
  Future<Either<ApiError, List<CategoryModel>>> getCategories();
}
