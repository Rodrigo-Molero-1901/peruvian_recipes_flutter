import 'package:fpdart/fpdart.dart';
import 'package:peruvian_recipes_flutter/core/network/api/api.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/core/network/response/detailed_recipe_response.dart';
import 'package:peruvian_recipes_flutter/core/network/response/most_liked_recipes_list_response.dart';
import 'package:peruvian_recipes_flutter/core/network/response/recipes_list_response.dart';

class RecipeApiManager {
  final Api _api;

  RecipeApiManager(this._api);

  Future<Either<ApiError, MostLikedRecipesListResponse>>
      getMostLikedRecipes() async {
    try {
      final response = await _api.recipesApi.getMostLikedRecipes();
      if (response.data != null) return Right(response.data!);
      return Left(ApiError.defaultError());
    } catch (_) {
      return Left(ApiError.defaultError());
    }
  }

  Future<Either<ApiError, RecipesListResponse>> getRecipes() async {
    try {
      final response = await _api.recipesApi.getRecipes();
      if (response.data != null) return Right(response.data!);
      return Left(ApiError.defaultError());
    } catch (_) {
      return Left(ApiError.defaultError());
    }
  }

  Future<Either<ApiError, DetailedRecipeResponse>> getRecipeDetails(
      {required String recipeId}) async {
    try {
      final response =
          await _api.recipesApi.getRecipeDetails(recipeId: recipeId);
      if (response.data != null) return Right(response.data!);
      return Left(ApiError.defaultError());
    } catch (_) {
      return Left(ApiError.defaultError());
    }
  }
}
