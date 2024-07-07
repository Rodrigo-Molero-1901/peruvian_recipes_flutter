import 'package:peruvian_recipes_flutter/features/authentication/domain/entitites/user.dart';

part 'auth_view_model_navigation.dart';

class AuthViewModel {
  final AuthViewModelNavigation? navigation;
  final UserEntity user;

  AuthViewModel.fromSuccessState({
    required this.user,
    this.navigation,
  });
}
