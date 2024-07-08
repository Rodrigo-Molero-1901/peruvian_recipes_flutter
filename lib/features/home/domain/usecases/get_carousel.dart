import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/features/home/data/models/most_liked_recipe_model.dart';
import 'package:peruvian_recipes_flutter/features/home/domain/repositories/carousel_repository.dart';

@injectable
class GetCarouselUseCase {
  final CarouselRepository _repository;

  GetCarouselUseCase(this._repository);

  Future<Either<ApiError, List<MostLikedRecipeModel>>>
      getMostLikedRecipes() async {
    return await _repository.getMostLikedRecipes();
  }
}
