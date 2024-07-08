import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/core/network/api_manager/api_manager.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/features/home/data/models/most_liked_recipe_model.dart';
import 'package:peruvian_recipes_flutter/features/home/data/models/most_liked_recipes_list_mapper.dart';
import 'package:peruvian_recipes_flutter/features/home/domain/repositories/carousel_repository.dart';

@Injectable(as: CarouselRepository)
class CarouselRepositoryImpl implements CarouselRepository {
  final ApiManager _apiManager;

  CarouselRepositoryImpl({
    required ApiManager apiManager,
  }) : _apiManager = apiManager;

  @override
  Future<Either<ApiError, List<MostLikedRecipeModel>>>
      getMostLikedRecipes() async {
    final mostLikedRecipesResponse =
        await _apiManager.recipesApiManager.getMostLikedRecipes();
    return mostLikedRecipesResponse.fold(
      (error) => Left(error),
      (response) => Right(mostLikedRecipesListFromResponse(response)),
    );
  }
}
