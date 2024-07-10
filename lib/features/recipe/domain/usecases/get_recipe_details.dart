import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/features/recipe/data/models/detailed_recipe_model.dart';
import 'package:peruvian_recipes_flutter/features/recipe/domain/repositories/recipe_repository.dart';

@injectable
class GetRecipeDetailsUseCase {
  final RecipeRepository _repository;

  GetRecipeDetailsUseCase(this._repository);

  Future<Either<ApiError, DetailedRecipeModel>> getRecipeDetails(
      {required String recipeId}) async {
    return await _repository.getRecipeDetails(recipeId: recipeId);
  }
}
