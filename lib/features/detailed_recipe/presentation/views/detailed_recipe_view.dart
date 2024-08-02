import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peruvian_recipes_flutter/di/injection.dart';
import 'package:peruvian_recipes_flutter/features/detailed_recipe/presentation/blocs/detailed_recipe_cubit.dart';
import 'package:peruvian_recipes_flutter/features/detailed_recipe/presentation/utils/recipe_details_view_model_extension.dart';
import 'package:peruvian_recipes_flutter/features/detailed_recipe/presentation/views/detailed_recipe_main_view.dart';

class DetailedRecipeView extends StatefulWidget {
  final String recipeId;

  const DetailedRecipeView({
    super.key,
    required this.recipeId,
  });

  @override
  State<DetailedRecipeView> createState() => _DetailedRecipeViewState();
}

class _DetailedRecipeViewState extends State<DetailedRecipeView> {
  late DetailedRecipeCubit _detailedRecipeCubit;

  @override
  void initState() {
    super.initState();
    _detailedRecipeCubit = injector<DetailedRecipeCubit>();
    _detailedRecipeCubit.initialize(recipeId: widget.recipeId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailedRecipeCubit, DetailedRecipeState>(
      bloc: _detailedRecipeCubit,
      listener: (context, state) {
        switch (state) {
          case DetailedRecipeLoading():
            break;
          case DetailedRecipeMain(:final viewModel):
            viewModel.showOverlay(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: switch (state) {
            DetailedRecipeLoading() => const Scaffold(body: SizedBox.shrink()),
            DetailedRecipeMain(:final viewModel) => DetailedRecipeMainView(
                viewModel: viewModel,
                cubit: _detailedRecipeCubit,
              ),
          },
        );
      },
    );
  }
}
