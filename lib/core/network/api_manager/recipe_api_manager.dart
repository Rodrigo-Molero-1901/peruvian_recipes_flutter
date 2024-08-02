import 'package:fpdart/fpdart.dart';
import 'package:peruvian_recipes_flutter/core/network/api/api.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/core/network/response/carousel_recipes_list_response.dart';
import 'package:peruvian_recipes_flutter/core/network/response/detailed_recipe_response.dart';
import 'package:peruvian_recipes_flutter/core/network/response/recipes_list_response.dart';

class RecipeApiManager {
  final Api _api;

  RecipeApiManager(this._api);

  Future<Either<ApiError, CarouselRecipesListResponse>>
      getCarouselRecipes() async {
    try {
      final response = await _api.recipesApi.getCarouselRecipes();
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

  Future<Either<ApiError, RecipesListResponse>> getFavoriteRecipes() async {
    try {
      final response = await _api.recipesApi.getFavoriteRecipes();
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

  Future<Either<bool, bool>> saveToFavorite({required String recipeId}) async {
    try {
      final recipeHasBeenSaved =
          await _api.recipesApi.saveToFavorite(recipeId: recipeId);
      return Right(recipeHasBeenSaved);
    } catch (_) {
      return const Left(false);
    }
  }

  Future<Either<bool, bool>> removeFromFavorite(
      {required String recipeId}) async {
    try {
      final recipeHasBeenSaved =
          await _api.recipesApi.removeFromFavorite(recipeId: recipeId);
      return Right(recipeHasBeenSaved);
    } catch (_) {
      return const Left(false);
    }
  }
}
