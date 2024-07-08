import 'package:fpdart/fpdart.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/features/home/data/models/most_liked_recipe_model.dart';

abstract class CarouselRepository {
  Future<Either<ApiError, List<MostLikedRecipeModel>>> getMostLikedRecipes();
}
