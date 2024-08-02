import 'package:peruvian_recipes_flutter/core/network/response/recipe_response.dart';
import 'package:peruvian_recipes_flutter/core/network/response/recipes_list_response.dart';
import 'package:peruvian_recipes_flutter/features/recipes_list/data/models/recipe_model.dart';
import 'package:peruvian_recipes_flutter/shared/extensions/iterable_extension.dart';

RecipeModel _recipeModelFromResponse(RecipeResponse response) {
  return RecipeModel(
    id: response.id,
    category: response.category,
    imageURL: response.imageURL,
    title: response.title,
  );
}

List<RecipeModel> recipesListFromResponse(RecipesListResponse response) {
  if (response.recipes.isNull || response.recipes.safeIsEmpty) {
    return [];
  }
  return response.recipes.safe.map(_recipeModelFromResponse).toList();
}
