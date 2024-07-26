import 'package:peruvian_recipes_flutter/features/home/domain/entitites/carousel_recipe.dart';
import 'package:peruvian_recipes_flutter/features/home/domain/entitites/category.dart';
import 'package:peruvian_recipes_flutter/features/home/presentation/utils/home_enums.dart';
import 'package:peruvian_recipes_flutter/features/home/presentation/viewmodels/carousel_recipe_view_model.dart';
import 'package:peruvian_recipes_flutter/features/home/presentation/viewmodels/category_view_model.dart';

part 'home_view_model_navigation.dart';

class HomeViewModel {
  final RecipesCarouselStatus recipesCarouselStatus;
  final CategoryStatus categoryStatus;
  final List<CarouselRecipeViewModel> carouselRecipesViewModels;
  final List<CategoryViewModel> categoryViewModels;
  final HomeViewModelNavigation? navigation;

  HomeViewModel.fromSuccessState({
    required this.recipesCarouselStatus,
    required this.categoryStatus,
    required List<CarouselRecipeEntity> carouselRecipes,
    required List<CategoryEntity> categories,
    this.navigation,
  })  : carouselRecipesViewModels =
            carouselRecipes.map(CarouselRecipeViewModel.fromEntity).toList(),
        categoryViewModels =
            categories.map(CategoryViewModel.fromEntity).toList();
}
