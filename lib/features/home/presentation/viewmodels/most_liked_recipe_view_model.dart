import 'package:peruvian_recipes_flutter/features/home/domain/entitites/most_liked_recipe.dart';

class MostLikedRecipeViewModel {
  String category;
  String imageURL;
  String title;
  String votes;

  MostLikedRecipeViewModel({
    required this.category,
    required this.imageURL,
    required this.title,
    required this.votes,
  });

  MostLikedRecipeViewModel.fromEntity(MostLikedRecipeEntity entity)
      : category = entity.category,
        imageURL = entity.imageURL,
        title = entity.title,
        votes = entity.votes.toString();
}
