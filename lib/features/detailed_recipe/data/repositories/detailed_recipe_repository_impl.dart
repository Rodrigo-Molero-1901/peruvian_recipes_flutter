import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/core/network/api_manager/api_manager.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/features/detailed_recipe/data/models/detailed_recipe_model.dart';
import 'package:peruvian_recipes_flutter/features/detailed_recipe/data/models/detailed_recipe_model_mapper.dart';
import 'package:peruvian_recipes_flutter/features/detailed_recipe/domain/repositories/detailed_recipe_repository.dart';

@Injectable(as: DetailedRecipeRepository)
class DetailedRecipeRepositoryImpl implements DetailedRecipeRepository {
  final ApiManager _apiManager;

  DetailedRecipeRepositoryImpl({
    required ApiManager apiManager,
  }) : _apiManager = apiManager;

  @override
  Future<Either<ApiError, DetailedRecipeModel>> getRecipeDetails(
      {required String recipeId}) async {
    final detailedRecipeResponse = await _apiManager.recipesApiManager
        .getRecipeDetails(recipeId: recipeId);
    return detailedRecipeResponse.fold(
      (error) => Left(error),
      (response) => Right(detailedRecipeFromResponse(response)),
    );
  }

  @override
  Future<Either<bool, bool>> saveToFavorite({required String recipeId}) async {
    return await _apiManager.recipesApiManager
        .saveToFavorite(recipeId: recipeId);
  }

  @override
  Future<Either<bool, bool>> removeFromFavorite(
      {required String recipeId}) async {
    return await _apiManager.recipesApiManager
        .removeFromFavorite(recipeId: recipeId);
  }
}
