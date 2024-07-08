import 'package:peruvian_recipes_flutter/core/network/response/most_liked_recipe_response.dart';

class MostLikedRecipesListResponse {
  List<MostLikedRecipeResponse>? mostLikedRecipes;

  MostLikedRecipesListResponse({
    this.mostLikedRecipes,
  });

  factory MostLikedRecipesListResponse.fromJsonList(
      List<Map<String, dynamic>>? docs) {
    return MostLikedRecipesListResponse(
      mostLikedRecipes: List.from(
        (docs ?? []).map(MostLikedRecipeResponse.fromJson),
      ),
    );
  }
}
