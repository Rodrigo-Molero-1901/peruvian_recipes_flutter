import 'package:peruvian_recipes_flutter/features/home/data/models/carousel_recipe_model.dart';
import 'package:peruvian_recipes_flutter/shared/extensions/int_extension.dart';
import 'package:peruvian_recipes_flutter/shared/extensions/string_extension.dart';

class CarouselRecipeEntity {
  String id;
  String category;
  String imageURL;
  String title;
  int votes;

  CarouselRecipeEntity({
    required this.id,
    required this.category,
    required this.imageURL,
    required this.title,
    required this.votes,
  });

  factory CarouselRecipeEntity.fromModel(CarouselRecipeModel model) {
    return CarouselRecipeEntity(
      id: model.id.safe,
      category: model.category.safe,
      imageURL: model.imageURL.safe,
      title: model.title.safe,
      votes: model.votes.safe,
    );
  }
}
