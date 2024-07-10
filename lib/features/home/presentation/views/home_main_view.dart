import 'package:flutter/material.dart';
import 'package:peruvian_recipes_flutter/features/home/presentation/blocs/home_cubit.dart';
import 'package:peruvian_recipes_flutter/features/home/presentation/viewmodels/home_view_model.dart';

class HomeMainView extends StatelessWidget {
  final HomeViewModel viewModel;
  final HomeCubit homeCubit;

  const HomeMainView({
    super.key,
    required this.viewModel,
    required this.homeCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: viewModel.mostLikedRecipeViewModels.length,
                itemBuilder: (context, i) {
                  final recipe = viewModel.mostLikedRecipeViewModels[i];
                  return ListTile(
                    onTap: () => homeCubit.onMostLikedRecipeTapped(pos: i),
                    title: Text(recipe.title),
                    subtitle: Text(recipe.category),
                    trailing: Text(recipe.votes),
                  );
                },
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: viewModel.categoryViewModels.length,
                itemBuilder: (context, i) {
                  final category = viewModel.categoryViewModels[i];
                  return Chip(
                    avatar: const Icon(Icons.fastfood),
                    label: Text(category.title),
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
