import 'package:fpdart/fpdart.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/features/recipes_list/data/models/recipe_model.dart';

abstract class RecipesListRepository {
  Future<Either<ApiError, List<RecipeModel>>> getRecipes();

  Future<Either<ApiError, List<RecipeModel>>> getFavoriteRecipes();

  Future<Either<bool, bool>> saveToFavorite({required String recipeId});

  Future<Either<bool, bool>> removeFromFavorite({required String recipeId});
}
