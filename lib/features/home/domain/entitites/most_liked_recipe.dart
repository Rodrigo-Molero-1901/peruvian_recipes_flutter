import 'package:peruvian_recipes_flutter/features/home/data/models/most_liked_recipe_model.dart';
import 'package:peruvian_recipes_flutter/shared/extensions/int_extension.dart';
import 'package:peruvian_recipes_flutter/shared/extensions/string_extension.dart';

class MostLikedRecipeEntity {
  String id;
  String category;
  String imageURL;
  String title;
  int votes;

  MostLikedRecipeEntity({
    required this.id,
    required this.category,
    required this.imageURL,
    required this.title,
    required this.votes,
  });

  factory MostLikedRecipeEntity.fromModel(MostLikedRecipeModel model) {
    return MostLikedRecipeEntity(
      id: model.id.safe,
      category: model.category.safe,
      imageURL: model.imageURL.safe,
      title: model.title.safe,
      votes: model.votes.safe,
    );
  }
}
