import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peruvian_recipes_flutter/di/injection.dart';
import 'package:peruvian_recipes_flutter/features/authentication/presentation/blocs/auth_cubit.dart';
import 'package:peruvian_recipes_flutter/features/authentication/presentation/utils/auth_view_model_extension.dart';
import 'package:peruvian_recipes_flutter/features/authentication/presentation/views/auth_main_view.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  late AuthCubit _authCubit;

  @override
  void initState() {
    super.initState();
    _authCubit = injector<AuthCubit>();
    _authCubit.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _authCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      bloc: _authCubit,
      listener: (context, state) {
        switch (state) {
          case AuthLoading():
            break;
          case AuthMain(:final viewModel):
            {
              viewModel.showOverlay(context);
              viewModel.navigate(context);
            }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: switch (state) {
            AuthLoading() => const SizedBox.shrink(),
            AuthMain(:final viewModel) => AuthMainView(
                viewModel: viewModel,
                cubit: _authCubit,
              ),
          },
        );
      },
    );
  }
}
