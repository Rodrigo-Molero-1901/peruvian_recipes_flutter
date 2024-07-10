import 'package:peruvian_recipes_flutter/features/authentication/domain/entitites/user.dart';
import 'package:peruvian_recipes_flutter/shared/viewmodels/overlay_view_model.dart';

part 'auth_view_model_navigation.dart';

class AuthViewModel {
  final UserEntity user;
  final AuthViewModelNavigation? navigation;
  final OverlayViewModel? overlay;

  AuthViewModel.fromSuccessState({
    required this.user,
    this.navigation,
    this.overlay,
  });
}
