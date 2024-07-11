import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peruvian_recipes_flutter/di/injection.dart';
import 'package:peruvian_recipes_flutter/features/recipe/presentation/blocs/recipes_list_cubit.dart';
import 'package:peruvian_recipes_flutter/features/recipe/presentation/views/recipes_list_main_view.dart';

class RecipesListView extends StatefulWidget {
  const RecipesListView({super.key});

  @override
  State<RecipesListView> createState() => _RecipesListViewState();
}

class _RecipesListViewState extends State<RecipesListView> {
  late RecipesListCubit _recipesListCubit;

  @override
  void initState() {
    super.initState();
    _recipesListCubit = injector<RecipesListCubit>();
    _recipesListCubit.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipesListCubit, RecipesListState>(
      bloc: _recipesListCubit,
      listener: (context, state) {
        switch (state) {
          case RecipesListLoading():
          case RecipesListMain(:final viewModel):
            break;
        }
      },
      builder: (context, state) {
        return switch (state) {
          RecipesListLoading() => const SizedBox.shrink(),
          RecipesListMain(:final viewModel) => RecipesListMainView(
              viewModel: viewModel,
              cubit: _recipesListCubit,
            ),
        };
      },
    );
  }
}
