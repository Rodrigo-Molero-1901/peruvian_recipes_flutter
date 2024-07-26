import 'package:peruvian_recipes_flutter/features/recipe/domain/entitites/recipe_card.dart';
import 'package:peruvian_recipes_flutter/features/recipe/presentation/viewmodels/recipes_list/recipe_card_view_model.dart';
import 'package:peruvian_recipes_flutter/shared/viewmodels/overlay_view_model.dart';

class RecipesListViewModel {
  final List<RecipeCardViewModel> recipeViewModels;
  final OverlayViewModel? overlay;

  RecipesListViewModel.fromSuccessState({
    required List<RecipeCardEntity> recipes,
    this.overlay,
  }) : recipeViewModels = recipes.map(RecipeCardViewModel.fromEntity).toList();
}
