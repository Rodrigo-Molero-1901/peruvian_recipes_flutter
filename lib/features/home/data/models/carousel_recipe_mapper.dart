import 'package:peruvian_recipes_flutter/core/network/response/carousel_recipe_response.dart';
import 'package:peruvian_recipes_flutter/core/network/response/carousel_recipes_list_response.dart';
import 'package:peruvian_recipes_flutter/features/home/data/models/carousel_recipe_model.dart';
import 'package:peruvian_recipes_flutter/shared/extensions/iterable_extension.dart';

CarouselRecipeModel _carouselRecipeFromResponse(
    CarouselRecipeResponse response) {
  return CarouselRecipeModel(
    id: response.id,
    category: response.category,
    imageURL: response.imageURL,
    title: response.title,
    votes: response.votes,
  );
}

List<CarouselRecipeModel> carouselRecipesListFromResponse(
    CarouselRecipesListResponse response) {
  if (response.carouselRecipes.isNull || response.carouselRecipes.safeIsEmpty) {
    return [];
  }
  return response.carouselRecipes.safe
      .map(_carouselRecipeFromResponse)
      .toList();
}
