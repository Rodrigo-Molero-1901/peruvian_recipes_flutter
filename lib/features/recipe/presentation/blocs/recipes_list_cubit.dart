import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peruvian_recipes_flutter/features/recipe/data/models/recipe_model.dart';
import 'package:peruvian_recipes_flutter/features/recipe/domain/entitites/recipe.dart';
import 'package:peruvian_recipes_flutter/features/recipe/domain/usecases/get_recipes.dart';
import 'package:peruvian_recipes_flutter/features/recipe/presentation/viewmodels/recipes_list_view_model.dart';
import 'package:peruvian_recipes_flutter/shared/mixins/connectivity_mixin.dart';

part 'recipes_list_state.dart';

class RecipesListCubit extends Cubit<RecipesListState> with ConnectivityMixin {
  final GetRecipesUseCase _getRecipesUseCase;

  RecipesListCubit({
    required GetRecipesUseCase getRecipesUseCase,
  })  : _getRecipesUseCase = getRecipesUseCase,
        super(RecipesListLoading());

  var _recipes = <RecipeModel>[];

  Future<void> initialize() async {
    if (await hasConnectivity) {
      await _getRecipes();
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

  void _emitMain() {
    emit(
      RecipesListMain(
        viewModel: RecipesListViewModel.fromSuccessState(
          recipes: _recipes.map(RecipeEntity.fromModel).toList(),
        ),
      ),
    );
  }
}