import 'package:peruvian_recipes_flutter/features/home/domain/entitites/category.dart';
import 'package:peruvian_recipes_flutter/features/home/domain/entitites/most_liked_recipe.dart';
import 'package:peruvian_recipes_flutter/features/home/presentation/utils/home_enums.dart';
import 'package:peruvian_recipes_flutter/features/home/presentation/viewmodels/category_view_model.dart';
import 'package:peruvian_recipes_flutter/features/home/presentation/viewmodels/most_liked_recipe_view_model.dart';

class HomeViewModel {
  final RecipesCarouselStatus recipesCarouselStatus;
  final CategoryStatus categoryStatus;
  final List<MostLikedRecipeViewModel> mostLikedRecipeViewModels;
  final List<CategoryViewModel> categoryViewModels;

  HomeViewModel.fromSuccessState({
    required this.recipesCarouselStatus,
    required this.categoryStatus,
    required List<MostLikedRecipeEntity> carouselRecipes,
    required List<CategoryEntity> categories,
  })  : mostLikedRecipeViewModels =
            carouselRecipes.map(MostLikedRecipeViewModel.fromEntity).toList(),
        categoryViewModels =
            categories.map(CategoryViewModel.fromEntity).toList();
}
