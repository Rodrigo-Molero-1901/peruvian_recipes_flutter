import 'package:peruvian_recipes_flutter/features/recipes_list/domain/entitites/recipe.dart';
import 'package:peruvian_recipes_flutter/features/recipes_list/presentation/viewmodels/recipe_view_model.dart';
import 'package:peruvian_recipes_flutter/shared/viewmodels/overlay_view_model.dart';

class RecipesListViewModel {
  final List<RecipeViewModel> recipeViewModels;
  final OverlayViewModel? overlay;

  RecipesListViewModel.fromSuccessState({
    required List<RecipeEntity> recipes,
    this.overlay,
  }) : recipeViewModels = recipes.map(RecipeViewModel.fromEntity).toList();
}
