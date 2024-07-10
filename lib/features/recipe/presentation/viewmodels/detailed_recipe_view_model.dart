import 'package:peruvian_recipes_flutter/features/recipe/domain/entitites/detailed_recipe.dart';

class DetailedRecipeViewModel {
  String id;
  String category;
  String description;
  String title;
  String videoURL;

  DetailedRecipeViewModel({
    required this.id,
    required this.category,
    required this.description,
    required this.title,
    required this.videoURL,
  });

  DetailedRecipeViewModel.fromEntity(DetailedRecipeEntity entity)
      : id = entity.id,
        category = entity.category,
        description = entity.description,
        title = entity.title,
        videoURL = entity.videoURL;
}
