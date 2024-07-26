import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/core/network/api_manager/api_manager.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/features/home/data/models/carousel_recipe_mapper.dart';
import 'package:peruvian_recipes_flutter/features/home/data/models/carousel_recipe_model.dart';
import 'package:peruvian_recipes_flutter/features/home/domain/repositories/carousel_repository.dart';

@Injectable(as: CarouselRepository)
class CarouselRepositoryImpl implements CarouselRepository {
  final ApiManager _apiManager;

  CarouselRepositoryImpl({
    required ApiManager apiManager,
  }) : _apiManager = apiManager;

  @override
  Future<Either<ApiError, List<CarouselRecipeModel>>>
      getCarouselRecipes() async {
    final mostLikedRecipesResponse =
        await _apiManager.recipesApiManager.getCarouselRecipes();
    return mostLikedRecipesResponse.fold(
      (error) => Left(error),
      (response) => Right(carouselRecipesListFromResponse(response)),
    );
  }
}
