import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/features/detailed_recipe/domain/repositories/detailed_recipe_repository.dart';

@injectable
class RemoveFromFavoriteUseCase {
  final DetailedRecipeRepository _repository;

  RemoveFromFavoriteUseCase(this._repository);

  Future<Either<bool, bool>> removeFromFavorite(
      {required String recipeId}) async {
    return await _repository.removeFromFavorite(recipeId: recipeId);
  }
}
