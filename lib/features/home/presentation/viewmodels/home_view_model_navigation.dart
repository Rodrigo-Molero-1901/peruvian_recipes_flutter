part of 'home_view_model.dart';

sealed class HomeViewModelNavigation {}

class HomeDetailedRecipeNavigation extends HomeViewModelNavigation {
  final String recipeId;

  HomeDetailedRecipeNavigation({
    required this.recipeId,
  });
}
