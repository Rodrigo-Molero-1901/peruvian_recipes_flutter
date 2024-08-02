part of 'recipes_list_cubit.dart';

sealed class RecipesListState extends Equatable {}

class RecipesListLoading extends RecipesListState {
  @override
  List<Object?> get props => [];
}

class RecipesListMain extends RecipesListState {
  final RecipesListViewModel viewModel;

  RecipesListMain({
    required this.viewModel,
  });

  @override
  List<Object?> get props => [viewModel];
}
