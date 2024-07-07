import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:peruvian_recipes_flutter/core/router/router.dart';
import 'package:peruvian_recipes_flutter/features/authentication/presentation/viewmodels/auth_view_model.dart';
import 'package:peruvian_recipes_flutter/shared/viewmodels/snack_bar_view_model.dart';
import 'package:peruvian_recipes_flutter/shared/widgets/app_snack_bar.dart';

extension AuthViewModelExtension on AuthViewModel {
  void navigate(BuildContext context) {
    if (navigation != null) {
      switch (navigation!) {
        case AuthRegisterUserNavigation():
        case AuthForgotPasswordNavigation():
          break;
        case AuthLoggedInNavigation():
          context.push(Routes.pathHome, extra: user);
      }
    }
  }

  void showOverlay(BuildContext context) {
    if (overlay != null) {
      switch (overlay!) {
        case GenericError():
          AppSnackBar.showSnackBar(context: context);
      }
    }
  }
}