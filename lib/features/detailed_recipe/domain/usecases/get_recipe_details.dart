import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/features/detailed_recipe/data/models/detailed_recipe_model.dart';
import 'package:peruvian_recipes_flutter/features/detailed_recipe/domain/repositories/detailed_recipe_repository.dart';

@injectable
class GetRecipeDetailsUseCase {
  final DetailedRecipeRepository _repository;

  GetRecipeDetailsUseCase(this._repository);

  Future<Either<ApiError, DetailedRecipeModel>> getRecipeDetails(
      {required String recipeId}) async {
    return await _repository.getRecipeDetails(recipeId: recipeId);
  }
}
