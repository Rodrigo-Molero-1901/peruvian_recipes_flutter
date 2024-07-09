import 'package:peruvian_recipes_flutter/core/network/response/most_liked_recipe_response.dart';

class MostLikedRecipeModel {
  String? category;
  String? imageURL;
  String? title;
  int? votes;

  MostLikedRecipeModel({
    this.category,
    this.imageURL,
    this.title,
    this.votes,
  });

  factory MostLikedRecipeModel.fromResponse(MostLikedRecipeResponse response) {
    return MostLikedRecipeModel(
      category: response.category,
      imageURL: response.imageURL,
      title: response.title,
      votes: response.votes,
    );
  }
}
