import 'package:peruvian_recipes_flutter/features/recipe/domain/entitites/detailed_recipe.dart';
import 'package:peruvian_recipes_flutter/shared/viewmodels/overlay_view_model.dart';

class RecipeDetailsViewModel {
  final String id;
  final String category;
  final String description;
  final String title;
  final String videoURL;
  final OverlayViewModel? overlay;

  RecipeDetailsViewModel.fromSuccessState({
    required DetailedRecipeEntity detailedRecipe,
    this.overlay,
  })  : id = detailedRecipe.id,
        category = detailedRecipe.category,
        description = detailedRecipe.description,
        title = detailedRecipe.title,
        videoURL = detailedRecipe.videoURL;
}
