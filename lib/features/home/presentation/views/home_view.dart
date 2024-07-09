import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peruvian_recipes_flutter/di/injection.dart';
import 'package:peruvian_recipes_flutter/features/authentication/domain/entitites/user.dart';
import 'package:peruvian_recipes_flutter/features/home/presentation/blocs/home_cubit.dart';

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
      listener: (context, state) {},
      builder: (context, state) {
        return switch (state) {
          HomeLoading() => const SizedBox.shrink(),
          HomeMain(:final viewModel) => const Scaffold(
              body: Center(
                child: Text('loggeado'),
              ),
            ),
          // TODO: Handle this case.
          Object() => throw UnimplementedError(),
        };
      },
    );
  }
}
