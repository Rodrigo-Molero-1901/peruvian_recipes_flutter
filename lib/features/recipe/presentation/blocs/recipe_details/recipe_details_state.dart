part of 'recipe_details_cubit.dart';

sealed class RecipeDetailsState extends Equatable {}

class RecipeDetailsLoading extends RecipeDetailsState {
  @override
  List<Object?> get props => [];
}

class RecipeDetailsMain extends RecipeDetailsState {
  final RecipeDetailsViewModel viewModel;

  RecipeDetailsMain({
    required this.viewModel,
  });

  @override
  List<Object?> get props => [viewModel];
}
