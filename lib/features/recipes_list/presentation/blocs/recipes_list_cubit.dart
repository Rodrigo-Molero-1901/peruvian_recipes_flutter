import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/features/recipes_list/data/models/recipe_model.dart';
import 'package:peruvian_recipes_flutter/features/recipes_list/domain/entitites/recipe.dart';
import 'package:peruvian_recipes_flutter/features/recipes_list/domain/usecases/get_favorite_recipes.dart';
import 'package:peruvian_recipes_flutter/features/recipes_list/domain/usecases/get_recipes.dart';
import 'package:peruvian_recipes_flutter/features/recipes_list/presentation/viewmodels/recipes_list_view_model.dart';
import 'package:peruvian_recipes_flutter/shared/mixins/connectivity_mixin.dart';

part 'recipes_list_state.dart';

@injectable
class RecipesListCubit extends Cubit<RecipesListState> with ConnectivityMixin {
  final GetRecipesUseCase _getRecipesUseCase;
  final GetFavoriteRecipesUseCase _getFavoriteRecipesUseCase;

  RecipesListCubit({
    required GetRecipesUseCase getRecipesUseCase,
    required GetFavoriteRecipesUseCase getFavoriteRecipesUseCase,
  })  : _getRecipesUseCase = getRecipesUseCase,
        _getFavoriteRecipesUseCase = getFavoriteRecipesUseCase,
        super(RecipesListLoading());

  var _recipes = <RecipeModel>[];
  var _favoriteRecipes = <RecipeModel>[];

  Future<void> initialize() async {
    if (await hasConnectivity) {
      await _getRecipes();
      // TODO: remove
      await _getFavoriteRecipes();
      _emitMain();
    } else {
      //TODO add anything for reload
    }
  }

  //TODO add logic to load recipes when scrolling

  Future<void> _getRecipes() async {
    final result = await _getRecipesUseCase.getRecipes();
    result.fold(
      (error) {},
      (recipesModelList) {
        _recipes = recipesModelList;
      },
    );
  }

  // TODO remove auxiliary function, move to its own cubit
  Future<void> _getFavoriteRecipes() async {
    final result = await _getFavoriteRecipesUseCase.getFavoriteRecipes();
    result.fold(
      (error) {},
      (favoriteRecipesModelList) {
        _favoriteRecipes = favoriteRecipesModelList;
      },
    );
  }

  void _emitMain() {
    emit(
      RecipesListMain(
        viewModel: RecipesListViewModel.fromSuccessState(
          recipes: _favoriteRecipes.map(RecipeEntity.fromModel).toList(),
        ),
      ),
    );
  }
}
