import 'package:peruvian_recipes_flutter/features/home/domain/entitites/category.dart';
import 'package:peruvian_recipes_flutter/features/home/domain/entitites/most_liked_recipe.dart';
import 'package:peruvian_recipes_flutter/features/home/presentation/utils/home_enums.dart';
import 'package:peruvian_recipes_flutter/features/home/presentation/viewmodels/category_view_model.dart';
import 'package:peruvian_recipes_flutter/features/home/presentation/viewmodels/most_liked_recipe_view_model.dart';

part 'home_view_model_navigation.dart';

class HomeViewModel {
  final RecipesCarouselStatus recipesCarouselStatus;
  final CategoryStatus categoryStatus;
  final List<MostLikedRecipeViewModel> mostLikedRecipeViewModels;
  final List<CategoryViewModel> categoryViewModels;
  final HomeViewModelNavigation? navigation;

  HomeViewModel.fromSuccessState({
    required this.recipesCarouselStatus,
    required this.categoryStatus,
    required List<MostLikedRecipeEntity> carouselRecipes,
    required List<CategoryEntity> categories,
    this.navigation,
  })  : mostLikedRecipeViewModels =
            carouselRecipes.map(MostLikedRecipeViewModel.fromEntity).toList(),
        categoryViewModels =
            categories.map(CategoryViewModel.fromEntity).toList();
}
