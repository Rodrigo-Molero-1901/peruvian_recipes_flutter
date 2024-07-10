part of 'home_view_model.dart';

sealed class HomeViewModelNavigation {}

class HomeDetailedRecipeNavigation extends HomeViewModelNavigation {
  final MostLikedRecipeEntity recipe;

  HomeDetailedRecipeNavigation({
    required this.recipe,
  });
}
