import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/features/recipes_list/data/models/recipe_model.dart';
import 'package:peruvian_recipes_flutter/features/recipes_list/domain/repositories/recipes_list_repository.dart';

@injectable
class GetRecipesUseCase {
  final RecipesListRepository _repository;

  GetRecipesUseCase(this._repository);

  Future<Either<ApiError, List<RecipeModel>>> getRecipes() async {
    return await _repository.getRecipes();
  }
}
