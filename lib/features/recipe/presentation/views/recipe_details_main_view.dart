import 'package:flutter/material.dart';
import 'package:peruvian_recipes_flutter/features/recipe/presentation/blocs/recipe_details_cubit.dart';
import 'package:peruvian_recipes_flutter/features/recipe/presentation/viewmodels/recipe_details_view_model.dart';

class RecipeDetailsMainView extends StatelessWidget {
  final RecipeDetailsViewModel viewModel;
  final RecipeDetailsCubit recipeDetailsCubit;

  const RecipeDetailsMainView({
    super.key,
    required this.viewModel,
    required this.recipeDetailsCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.detailedRecipeViewModel.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(viewModel.detailedRecipeViewModel.category),
            const SizedBox(height: 10),
            Text(viewModel.detailedRecipeViewModel.description),
          ],
        ),
      ),
    );
  }
}