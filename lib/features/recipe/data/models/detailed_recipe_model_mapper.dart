import 'package:peruvian_recipes_flutter/core/network/response/detailed_recipe_response.dart';
import 'package:peruvian_recipes_flutter/features/recipe/data/models/detailed_recipe_model.dart';

DetailedRecipeModel detailedRecipeFromResponse(
    DetailedRecipeResponse response) {
  return DetailedRecipeModel(
    id: response.id,
    category: response.category,
    description: response.description,
    title: response.title,
    videoURL: response.videoURL,
  );
}
