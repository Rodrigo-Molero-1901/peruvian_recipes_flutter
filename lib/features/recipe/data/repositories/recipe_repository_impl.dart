import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/core/network/api_manager/api_manager.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/features/recipe/data/models/detailed_recipe_model.dart';
import 'package:peruvian_recipes_flutter/features/recipe/data/models/detailed_recipe_model_mapper.dart';
import 'package:peruvian_recipes_flutter/features/recipe/data/models/recipe_model.dart';
import 'package:peruvian_recipes_flutter/features/recipe/data/models/recipe_model_mapper.dart';
import 'package:peruvian_recipes_flutter/features/recipe/domain/repositories/recipe_repository.dart';

@Injectable(as: RecipeRepository)
class RecipeRepositoryImpl implements RecipeRepository {
  final ApiManager _apiManager;

  RecipeRepositoryImpl({
    required ApiManager apiManager,
  }) : _apiManager = apiManager;

  @override
  Future<Either<ApiError, List<RecipeModel>>> getRecipes() async {
    final recipesResponse = await _apiManager.recipesApiManager.getRecipes();
    return recipesResponse.fold(
      (error) => Left(error),
      (response) => Right(recipesListFromResponse(response)),
    );
  }

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
}
