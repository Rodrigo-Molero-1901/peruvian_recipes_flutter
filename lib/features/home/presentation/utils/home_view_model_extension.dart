import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:peruvian_recipes_flutter/core/router/router.dart';
import 'package:peruvian_recipes_flutter/features/home/presentation/viewmodels/home_view_model.dart';

extension HomeViewModelExtension on HomeViewModel {
  void navigate(BuildContext context) {
    if (navigation != null) {
      switch (navigation!) {
        case HomeDetailedRecipeNavigation(:final recipeId):
          context.push(Routes.pathRecipeDetails, extra: recipeId);
        case HomeRecipesListNavigation():
          context.push(Routes.pathRecipesList);
      }
    }
  }
}
