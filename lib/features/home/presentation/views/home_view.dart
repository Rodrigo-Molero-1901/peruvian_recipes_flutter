import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peruvian_recipes_flutter/di/injection.dart';
import 'package:peruvian_recipes_flutter/features/authentication/domain/entitites/user.dart';
import 'package:peruvian_recipes_flutter/features/home/presentation/blocs/home_cubit.dart';
import 'package:peruvian_recipes_flutter/features/home/presentation/utils/home_view_model_extension.dart';
import 'package:peruvian_recipes_flutter/features/home/presentation/views/home_main_view.dart';

class HomeView extends StatefulWidget {
  final UserEntity user;

  const HomeView({
    super.key,
    required this.user,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeCubit _homeCubit;

  @override
  void initState() {
    super.initState();
    _homeCubit = injector<HomeCubit>();
    _homeCubit.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      bloc: _homeCubit,
      listener: (context, state) {
        switch (state) {
          case HomeLoading():
            break;
          case HomeMain(:final viewModel):
            viewModel.navigate(context);
        }
      },
      builder: (context, state) {
        return switch (state) {
          HomeLoading() => const SizedBox.shrink(),
          HomeMain(:final viewModel) => HomeMainView(
              viewModel: viewModel,
              homeCubit: _homeCubit,
            ),
        };
      },
    );
  }
}
