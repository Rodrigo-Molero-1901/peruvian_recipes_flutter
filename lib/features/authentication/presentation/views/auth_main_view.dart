import 'package:flutter/material.dart';
import 'package:peruvian_recipes_flutter/features/authentication/presentation/blocs/auth_cubit.dart';
import 'package:peruvian_recipes_flutter/features/authentication/presentation/viewmodels/auth_view_model.dart';

class AuthMainView extends StatelessWidget {
  final AuthViewModel viewModel;
  final AuthCubit authCubit;

  const AuthMainView({
    super.key,
    required this.viewModel,
    required this.authCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: authCubit.googleLogin,
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.greenAccent,
                child: const Center(
                  child: Text('google login'),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: authCubit.registerUser,
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.lightBlueAccent,
                child: const Center(
                  child: Text('register user'),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: authCubit.logout,
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.redAccent,
                child: const Center(
                  child: Text('cerrar sesion'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
