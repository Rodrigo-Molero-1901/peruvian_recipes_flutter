import 'package:fpdart/fpdart.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/features/detailed_recipe/data/models/detailed_recipe_model.dart';

abstract class DetailedRecipeRepository {
  Future<Either<ApiError, DetailedRecipeModel>> getRecipeDetails(
      {required String recipeId});

  Future<Either<bool, bool>> saveToFavorite({required String recipeId});

  Future<Either<bool, bool>> removeFromFavorite({required String recipeId});
}
