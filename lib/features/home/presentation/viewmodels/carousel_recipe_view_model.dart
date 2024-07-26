import 'package:peruvian_recipes_flutter/features/home/domain/entitites/carousel_recipe.dart';

class CarouselRecipeViewModel {
  String category;
  String imageURL;
  String title;
  String votes;

  CarouselRecipeViewModel({
    required this.category,
    required this.imageURL,
    required this.title,
    required this.votes,
  });

  CarouselRecipeViewModel.fromEntity(CarouselRecipeEntity entity)
      : category = entity.category,
        imageURL = entity.imageURL,
        title = entity.title,
        votes = entity.votes.toString();
}
