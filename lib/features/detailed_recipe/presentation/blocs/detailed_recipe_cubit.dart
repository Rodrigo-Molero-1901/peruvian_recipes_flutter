import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/features/detailed_recipe/data/models/detailed_recipe_model.dart';
import 'package:peruvian_recipes_flutter/features/detailed_recipe/domain/entities/detailed_recipe.dart';
import 'package:peruvian_recipes_flutter/features/detailed_recipe/domain/usecases/get_recipe_details.dart';
import 'package:peruvian_recipes_flutter/features/detailed_recipe/domain/usecases/save_to_favorite.dart';
import 'package:peruvian_recipes_flutter/features/detailed_recipe/presentation/viewmodels/recipe_details_view_model.dart';
import 'package:peruvian_recipes_flutter/shared/mixins/connectivity_mixin.dart';

part 'detailed_recipe_state.dart';

@injectable
class DetailedRecipeCubit extends Cubit<DetailedRecipeState>
    with ConnectivityMixin {
  final GetRecipeDetailsUseCase _getRecipeDetailsUseCase;
  final SaveToFavoriteUseCase _saveToFavoriteUseCase;

  DetailedRecipeCubit({
    required GetRecipeDetailsUseCase getRecipeDetailsUseCase,
    required SaveToFavoriteUseCase saveToFavoriteUseCase,
  })  : _getRecipeDetailsUseCase = getRecipeDetailsUseCase,
        _saveToFavoriteUseCase = saveToFavoriteUseCase,
        super(DetailedRecipeLoading());

  var _detailedRecipe = DetailedRecipeModel();

  Future<void> initialize({required String recipeId}) async {
    if (await hasConnectivity) {
      await _getRecipeDetails(recipeId: recipeId);
      _emitMain();
    } else {
      //TODO add error screen to support reload
    }
  }

  Future<void> _getRecipeDetails({required String recipeId}) async {
    final result =
        await _getRecipeDetailsUseCase.getRecipeDetails(recipeId: recipeId);
    result.fold(
      (error) {},
      (detailedRecipeModel) {
        _detailedRecipe = detailedRecipeModel;
      },
    );
  }

  void _emitMain() {
    emit(
      DetailedRecipeMain(
        viewModel: DetailedRecipeViewModel.fromSuccessState(
          detailedRecipe: DetailedRecipeEntity.fromModel(_detailedRecipe),
        ),
      ),
    );
  }

  Future<void> saveFavoriteRecipe({required String recipeId}) async {
    final result =
        await _saveToFavoriteUseCase.saveToFavorite(recipeId: recipeId);
    result.fold(
      (error) {},
      (recipeHasBeenSaved) {},
    );
  }
}
