import 'package:peruvian_recipes_flutter/features/recipe/data/models/recipe_model.dart';
import 'package:peruvian_recipes_flutter/shared/extensions/string_extension.dart';

class RecipeCardEntity {
  String id;
  String category;
  String imageURL;
  String title;

  RecipeCardEntity({
    required this.id,
    required this.category,
    required this.imageURL,
    required this.title,
  });

  factory RecipeCardEntity.fromModel(RecipeModel model) {
    return RecipeCardEntity(
      id: model.id.safe,
      category: model.category.safe,
      imageURL: model.imageURL.safe,
      title: model.title.safe,
    );
  }
}
