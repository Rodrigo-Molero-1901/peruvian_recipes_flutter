import 'package:peruvian_recipes_flutter/features/recipe/domain/entitites/detailed_recipe.dart';
import 'package:peruvian_recipes_flutter/features/recipe/presentation/viewmodels/detailed_recipe_view_model.dart';
import 'package:peruvian_recipes_flutter/shared/viewmodels/overlay_view_model.dart';

class RecipeDetailsViewModel {
  final DetailedRecipeViewModel detailedRecipeViewModel;
  final OverlayViewModel? overlay;

  RecipeDetailsViewModel.fromSuccessState({
    required DetailedRecipeEntity detailedRecipe,
    this.overlay,
  }) : detailedRecipeViewModel =
            DetailedRecipeViewModel.fromEntity(detailedRecipe);
}
