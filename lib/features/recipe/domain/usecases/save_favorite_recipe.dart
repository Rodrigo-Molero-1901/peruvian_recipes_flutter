import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/features/recipe/domain/repositories/recipe_repository.dart';

@injectable
class SaveFavoriteRecipeUseCase {
  final RecipeRepository _repository;

  SaveFavoriteRecipeUseCase(this._repository);

  Future<Either<bool, bool>> saveFavoriteRecipe(
      {required String recipeId}) async {
    return await _repository.saveFavoriteRecipe(recipeId: recipeId);
  }
}
