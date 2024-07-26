import 'package:peruvian_recipes_flutter/features/recipe/domain/entitites/recipe_card.dart';

class RecipeCardViewModel {
  final String id;
  final String category;
  final String imageURL;
  final String title;

  RecipeCardViewModel({
    required this.id,
    required this.category,
    required this.imageURL,
    required this.title,
  });

  RecipeCardViewModel.fromEntity(RecipeCardEntity entity)
      : id = entity.id,
        category = entity.category,
        imageURL = entity.imageURL,
        title = entity.title;
}
