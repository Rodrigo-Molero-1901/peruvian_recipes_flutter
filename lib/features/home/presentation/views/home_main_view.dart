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
    return const Scaffold(
      body: Center(
        child: Text('loggeado'),
      ),
    );
  }
}
