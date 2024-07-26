import 'package:flutter/material.dart';
import 'package:peruvian_recipes_flutter/features/home/presentation/blocs/home_cubit.dart';
import 'package:peruvian_recipes_flutter/features/home/presentation/viewmodels/home_view_model.dart';

class HomeMainView extends StatelessWidget {
  final HomeViewModel viewModel;
  final HomeCubit cubit;

  const HomeMainView({
    super.key,
    required this.viewModel,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: viewModel.carouselRecipesViewModels.length,
              itemBuilder: (context, i) {
                final recipe = viewModel.carouselRecipesViewModels[i];
                return ListTile(
                  onTap: () => cubit.onMostLikedRecipeTapped(pos: i),
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
          GestureDetector(
            onTap: cubit.goToFavoriteList,
            child: Container(
              color: Colors.cyanAccent,
              child: Text('ir a favoritos'),
            ),
          ),
        ],
      ),
    );
  }
}
