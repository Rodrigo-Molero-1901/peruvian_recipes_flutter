part of 'detailed_recipe_cubit.dart';

sealed class DetailedRecipeState extends Equatable {}

class DetailedRecipeLoading extends DetailedRecipeState {
  @override
  List<Object?> get props => [];
}

class DetailedRecipeMain extends DetailedRecipeState {
  final DetailedRecipeViewModel viewModel;

  DetailedRecipeMain({
    required this.viewModel,
  });

  @override
  List<Object?> get props => [viewModel];
}
