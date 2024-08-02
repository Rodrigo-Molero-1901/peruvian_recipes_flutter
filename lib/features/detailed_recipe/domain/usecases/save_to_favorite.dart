import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/features/detailed_recipe/domain/repositories/detailed_recipe_repository.dart';

@injectable
class SaveToFavoriteUseCase {
  final DetailedRecipeRepository _repository;

  SaveToFavoriteUseCase(this._repository);

  Future<Either<bool, bool>> saveToFavorite({required String recipeId}) async {
    return await _repository.saveToFavorite(recipeId: recipeId);
  }
}
