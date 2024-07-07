import 'package:peruvian_recipes_flutter/features/authentication/domain/entitites/user.dart';
import 'package:peruvian_recipes_flutter/shared/viewmodels/snack_bar_view_model.dart';

part 'auth_view_model_navigation.dart';

class AuthViewModel {
  final AuthViewModelNavigation? navigation;
  final SnackBarViewModel? overlay;
  final UserEntity user;

  AuthViewModel.fromSuccessState({
    required this.user,
    this.navigation,
    this.overlay,
  });
}
