import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/features/recipe/data/models/detailed_recipe_model.dart';
import 'package:peruvian_recipes_flutter/features/recipe/domain/entitites/detailed_recipe.dart';
import 'package:peruvian_recipes_flutter/features/recipe/domain/usecases/get_recipe_details.dart';
import 'package:peruvian_recipes_flutter/features/recipe/presentation/viewmodels/recipe_details_view_model.dart';
import 'package:peruvian_recipes_flutter/shared/mixins/connectivity_mixin.dart';

part 'recipe_details_state.dart';

@injectable
class RecipeDetailsCubit extends Cubit<RecipeDetailsState>
    with ConnectivityMixin {
  final GetRecipeDetailsUseCase _getRecipeDetailsUseCase;

  RecipeDetailsCubit({
    required GetRecipeDetailsUseCase getRecipeDetailsUseCase,
  })  : _getRecipeDetailsUseCase = getRecipeDetailsUseCase,
        super(RecipeDetailsLoading());

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
      RecipeDetailsMain(
        viewModel: RecipeDetailsViewModel.fromSuccessState(
          detailedRecipe: DetailedRecipeEntity.fromModel(_detailedRecipe),
        ),
      ),
    );
  }
}
