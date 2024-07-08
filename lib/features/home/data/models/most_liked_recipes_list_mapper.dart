import 'package:peruvian_recipes_flutter/core/network/response/most_liked_recipes_list_response.dart';
import 'package:peruvian_recipes_flutter/features/home/data/models/most_liked_recipe_model.dart';
import 'package:peruvian_recipes_flutter/shared/extensions/iterable_extension.dart';

List<MostLikedRecipeModel> mostLikedRecipesListFromResponse(
    MostLikedRecipesListResponse response) {
  if (response.mostLikedRecipes.isNull ||
      response.mostLikedRecipes.safeIsEmpty) {
    return [];
  }
  return List.from(response.mostLikedRecipes.safe);
}
