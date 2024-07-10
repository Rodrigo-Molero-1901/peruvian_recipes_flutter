import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/features/recipe/data/models/recipe_model.dart';
import 'package:peruvian_recipes_flutter/features/recipe/domain/repositories/recipe_repository.dart';

@injectable
class GetRecipesUseCase {
  final RecipeRepository _repository;

  GetRecipesUseCase(this._repository);

  Future<Either<ApiError, List<RecipeModel>>> getRecipes() async {
    return await _repository.getRecipes();
  }
}
