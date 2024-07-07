part of 'auth_view_model.dart';

sealed class AuthViewModelNavigation {}

class AuthRegisterUserNavigation extends AuthViewModelNavigation {}

class AuthForgotPasswordNavigation extends AuthViewModelNavigation {}

class AuthLoggedInNavigation extends AuthViewModelNavigation {}
