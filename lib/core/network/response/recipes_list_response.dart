import 'package:peruvian_recipes_flutter/core/network/response/recipe_response.dart';
import 'package:peruvian_recipes_flutter/shared/extensions/iterable_extension.dart';

class RecipesListResponse {
  List<RecipeResponse>? recipes;

  RecipesListResponse({
    this.recipes,
  });

  factory RecipesListResponse.fromJsonList(List<Map<String, dynamic>>? docs) {
    return RecipesListResponse(
      recipes: List.from(
        docs.safe.map(RecipeResponse.fromJson),
      ),
    );
  }
}
