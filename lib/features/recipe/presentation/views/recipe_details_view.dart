import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peruvian_recipes_flutter/di/injection.dart';
import 'package:peruvian_recipes_flutter/features/recipe/presentation/blocs/recipe_details/recipe_details_cubit.dart';
import 'package:peruvian_recipes_flutter/features/recipe/presentation/utils/recipe_details_view_model_extension.dart';
import 'package:peruvian_recipes_flutter/features/recipe/presentation/views/recipe_details_main_view.dart';

class RecipeDetailsView extends StatefulWidget {
  final String recipeId;

  const RecipeDetailsView({
    super.key,
    required this.recipeId,
  });

  @override
  State<RecipeDetailsView> createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends State<RecipeDetailsView> {
  late RecipeDetailsCubit _recipeDetailsCubit;

  @override
  void initState() {
    super.initState();
    _recipeDetailsCubit = injector<RecipeDetailsCubit>();
    _recipeDetailsCubit.initialize(recipeId: widget.recipeId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipeDetailsCubit, RecipeDetailsState>(
      bloc: _recipeDetailsCubit,
      listener: (context, state) {
        switch (state) {
          case RecipeDetailsLoading():
            break;
          case RecipeDetailsMain(:final viewModel):
            viewModel.showOverlay(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: switch (state) {
            RecipeDetailsLoading() => const Scaffold(body: SizedBox.shrink()),
            RecipeDetailsMain(:final viewModel) => RecipeDetailsMainView(
                viewModel: viewModel,
                cubit: _recipeDetailsCubit,
              ),
          },
        );
      },
    );
  }
}
