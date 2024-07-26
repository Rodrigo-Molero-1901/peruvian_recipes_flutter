import 'package:peruvian_recipes_flutter/core/network/response/carousel_recipe_response.dart';
import 'package:peruvian_recipes_flutter/shared/extensions/iterable_extension.dart';

class CarouselRecipesListResponse {
  List<CarouselRecipeResponse>? carouselRecipes;

  CarouselRecipesListResponse({
    this.carouselRecipes,
  });

  factory CarouselRecipesListResponse.fromJsonList(
      List<Map<String, dynamic>>? docs) {
    return CarouselRecipesListResponse(
      carouselRecipes: List.from(
        docs.safe.map(CarouselRecipeResponse.fromJson),
      ),
    );
  }
}
