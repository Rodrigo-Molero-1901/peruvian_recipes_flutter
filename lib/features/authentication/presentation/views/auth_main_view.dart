import 'package:flutter/material.dart';
import 'package:peruvian_recipes_flutter/features/authentication/presentation/blocs/auth_cubit.dart';
import 'package:peruvian_recipes_flutter/features/authentication/presentation/viewmodels/auth_view_model.dart';

class AuthMainView extends StatelessWidget {
  final AuthViewModel viewModel;
  final AuthCubit cubit;

  const AuthMainView({
    super.key,
    required this.viewModel,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: cubit.googleLogin,
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
            onTap: cubit.registerUser,
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
            onTap: cubit.logout,
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
