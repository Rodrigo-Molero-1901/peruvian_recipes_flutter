import 'package:flutter/material.dart';
import 'package:peruvian_recipes_flutter/features/detailed_recipe/presentation/blocs/detailed_recipe_cubit.dart';
import 'package:peruvian_recipes_flutter/features/detailed_recipe/presentation/viewmodels/recipe_details_view_model.dart';

class DetailedRecipeMainView extends StatelessWidget {
  final DetailedRecipeViewModel viewModel;
  final DetailedRecipeCubit cubit;

  const DetailedRecipeMainView({
    super.key,
    required this.viewModel,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(viewModel.category),
            const SizedBox(height: 10),
            Text(viewModel.description),
            const SizedBox(height: 30),
            IconButton(
              onPressed: () => cubit.saveFavoriteRecipe(recipeId: viewModel.id),
              icon: const Icon(Icons.plus_one),
            ),
          ],
        ),
      ),
    );
  }
}
