import 'package:peruvian_recipes_flutter/features/recipes_list/domain/entitites/recipe.dart';

class RecipeViewModel {
  final String id;
  final String category;
  final String imageURL;
  final String title;

  RecipeViewModel({
    required this.id,
    required this.category,
    required this.imageURL,
    required this.title,
  });

  RecipeViewModel.fromEntity(RecipeEntity entity)
      : id = entity.id,
        category = entity.category,
        imageURL = entity.imageURL,
        title = entity.title;
}
