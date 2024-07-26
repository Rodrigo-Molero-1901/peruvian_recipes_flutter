import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/features/home/data/models/carousel_recipe_model.dart';
import 'package:peruvian_recipes_flutter/features/home/data/models/category_model.dart';
import 'package:peruvian_recipes_flutter/features/home/domain/entitites/carousel_recipe.dart';
import 'package:peruvian_recipes_flutter/features/home/domain/entitites/category.dart';
import 'package:peruvian_recipes_flutter/features/home/domain/usecases/get_carousel.dart';
import 'package:peruvian_recipes_flutter/features/home/domain/usecases/get_categories.dart';
import 'package:peruvian_recipes_flutter/features/home/presentation/utils/home_enums.dart';
import 'package:peruvian_recipes_flutter/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:peruvian_recipes_flutter/shared/extensions/string_extension.dart';
import 'package:peruvian_recipes_flutter/shared/mixins/connectivity_mixin.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> with ConnectivityMixin {
  final GetCarouselUseCase _getCarouselUseCase;
  final GetCategoriesUseCase _getCategoriesUseCase;

  HomeCubit({
    required GetCarouselUseCase getCarouselUseCase,
    required GetCategoriesUseCase getCategoriesUseCase,
  })  : _getCarouselUseCase = getCarouselUseCase,
        _getCategoriesUseCase = getCategoriesUseCase,
        super(HomeLoading());

  var _recipesCarouselStatus = RecipesCarouselStatus.loading;
  var _categoryStatus = CategoryStatus.loading;
  var _carouselRecipes = <CarouselRecipeModel>[];
  var _categories = <CategoryModel>[];

  Future<void> initialize() async {
    _emitMain();
    if (await hasConnectivity) {
      await _fetchData();
      _emitMain();
    } else {
      //TODO Add error screen to support reload
    }
  }

  Future<void> _getRecipesCarousel() async {
    final result = await _getCarouselUseCase.getCarouselRecipes();
    result.fold(
      (error) {
        _recipesCarouselStatus = RecipesCarouselStatus.error;
      },
      (likedRecipesModelList) {
        _recipesCarouselStatus = RecipesCarouselStatus.success;
        _carouselRecipes = likedRecipesModelList;
      },
    );
  }

  Future<void> _getCategoriesList() async {
    final result = await _getCategoriesUseCase.getCategories();
    result.fold(
      (error) {
        _categoryStatus = CategoryStatus.error;
      },
      (categoriesModelList) {
        _categoryStatus = CategoryStatus.success;
        _categories = categoriesModelList;
      },
    );
  }

  Future<void> _fetchData() async {
    await Future.wait([
      _getRecipesCarousel(),
      _getCategoriesList(),
    ]);
  }

  void _emitMain({
    HomeViewModelNavigation? navigation,
  }) {
    emit(
      HomeMain(
        viewModel: HomeViewModel.fromSuccessState(
          recipesCarouselStatus: _recipesCarouselStatus,
          categoryStatus: _categoryStatus,
          carouselRecipes:
              _carouselRecipes.map(CarouselRecipeEntity.fromModel).toList(),
          categories: _categories.map(CategoryEntity.fromModel).toList(),
          navigation: navigation,
        ),
      ),
    );
  }

  void onMostLikedRecipeTapped({required int pos}) {
    _emitMain(
      navigation: HomeDetailedRecipeNavigation(
        recipeId: _carouselRecipes[pos].id.safe,
      ),
    );
  }

  void goToFavoriteList() {
    _emitMain(navigation: HomeRecipesListNavigation());
  }
}
