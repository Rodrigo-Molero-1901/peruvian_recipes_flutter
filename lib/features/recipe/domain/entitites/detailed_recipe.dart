import 'package:peruvian_recipes_flutter/features/recipe/data/models/detailed_recipe_model.dart';
import 'package:peruvian_recipes_flutter/shared/extensions/string_extension.dart';

class DetailedRecipeEntity {
  String id;
  String category;
  String description;
  String title;
  String videoURL;

  DetailedRecipeEntity({
    required this.id,
    required this.category,
    required this.description,
    required this.title,
    required this.videoURL,
  });

  factory DetailedRecipeEntity.fromModel(DetailedRecipeModel model) {
    return DetailedRecipeEntity(
      id: model.id.safe,
      category: model.category.safe,
      description: model.description.safe,
      title: model.title.safe,
      videoURL: model.videoURL.safe,
    );
  }
}
