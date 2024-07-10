import 'package:peruvian_recipes_flutter/core/network/response/most_liked_recipe_response.dart';
import 'package:peruvian_recipes_flutter/core/network/response/most_liked_recipes_list_response.dart';
import 'package:peruvian_recipes_flutter/features/home/data/models/most_liked_recipe_model.dart';
import 'package:peruvian_recipes_flutter/shared/extensions/iterable_extension.dart';

MostLikedRecipeModel _mostLikedRecipeFromResponse(
    MostLikedRecipeResponse response) {
  return MostLikedRecipeModel(
    id: response.id,
    category: response.category,
    imageURL: response.imageURL,
    title: response.title,
    votes: response.votes,
  );
}

List<MostLikedRecipeModel> mostLikedRecipesListFromResponse(
    MostLikedRecipesListResponse response) {
  if (response.mostLikedRecipes.isNull ||
      response.mostLikedRecipes.safeIsEmpty) {
    return [];
  }
  return response.mostLikedRecipes.safe
      .map(_mostLikedRecipeFromResponse)
      .toList();
}
