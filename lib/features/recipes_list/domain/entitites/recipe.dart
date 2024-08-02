import 'package:peruvian_recipes_flutter/features/recipes_list/data/models/recipe_model.dart';
import 'package:peruvian_recipes_flutter/shared/extensions/string_extension.dart';

class RecipeEntity {
  String id;
  String category;
  String imageURL;
  String title;

  RecipeEntity({
    required this.id,
    required this.category,
    required this.imageURL,
    required this.title,
  });

  factory RecipeEntity.fromModel(RecipeModel model) {
    return RecipeEntity(
      id: model.id.safe,
      category: model.category.safe,
      imageURL: model.imageURL.safe,
      title: model.title.safe,
    );
  }
}
