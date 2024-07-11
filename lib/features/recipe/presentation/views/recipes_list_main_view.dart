import 'package:flutter/material.dart';
import 'package:peruvian_recipes_flutter/features/recipe/presentation/blocs/recipes_list_cubit.dart';
import 'package:peruvian_recipes_flutter/features/recipe/presentation/viewmodels/recipes_list_view_model.dart';

class RecipesListMainView extends StatelessWidget {
  final RecipesListViewModel viewModel;
  final RecipesListCubit cubit;

  const RecipesListMainView({
    super.key,
    required this.viewModel,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text('Recetas favoritas'),
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: viewModel.recipeViewModels.length,
                itemBuilder: (context, i) {
                  final recipe = viewModel.recipeViewModels[i];
                  return ListTile(
                    title: Text(recipe.title),
                    subtitle: Text(recipe.category),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
