import 'package:fpdart/fpdart.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/features/recipe/data/models/detailed_recipe_model.dart';
import 'package:peruvian_recipes_flutter/features/recipe/data/models/recipe_model.dart';

abstract class RecipeRepository {
  Future<Either<ApiError, List<RecipeModel>>> getRecipes();

  Future<Either<ApiError, DetailedRecipeModel>> getRecipeDetails(
      {required String recipeId});
}
