import 'package:flutter/material.dart';
import 'package:peruvian_recipes_flutter/features/recipe/presentation/viewmodels/recipe_details/recipe_details_view_model.dart';
import 'package:peruvian_recipes_flutter/shared/viewmodels/overlay_view_model.dart';

extension RecipeDetailsViewModelExtension on RecipeDetailsViewModel {
  void showOverlay(BuildContext context) {
    if (overlay != null) {
      switch (overlay!) {
        case GenericError():
        case ShowLoadingDialog():
        case HideLoadingDialog():
          break;
      }
    }
  }
}
