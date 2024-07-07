import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/features/authentication/data/models/user_model.dart';
import 'package:peruvian_recipes_flutter/features/authentication/domain/entitites/user.dart';
import 'package:peruvian_recipes_flutter/features/authentication/domain/usecases/credentials_login.dart';
import 'package:peruvian_recipes_flutter/features/authentication/domain/usecases/google_login.dart';
import 'package:peruvian_recipes_flutter/features/authentication/domain/usecases/logout.dart';
import 'package:peruvian_recipes_flutter/features/authentication/domain/usecases/register_user.dart';
import 'package:peruvian_recipes_flutter/features/authentication/presentation/viewmodels/auth_view_model.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final RegisterUserUseCase _registerUserUseCase;
  final CredentialsLoginUseCase _credentialsLoginUseCase;
  final GoogleLoginUseCase _googleLoginUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthCubit({
    required RegisterUserUseCase registerUserUseCase,
    required CredentialsLoginUseCase credentialsLoginUseCase,
    required GoogleLoginUseCase googleLoginUseCase,
    required LogoutUseCase logoutUseCase,
  })  : _registerUserUseCase = registerUserUseCase,
        _credentialsLoginUseCase = credentialsLoginUseCase,
        _googleLoginUseCase = googleLoginUseCase,
        _logoutUseCase = logoutUseCase,
        super(AuthLoading());

  UserModel _userModel = UserModel();
  final _emailTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();

  Future<void> initialize() async {
    _emitMain();
  }

  Future<void> loginWithCredentials() async {
    final loginResult = await _credentialsLoginUseCase.loginWithCredentials(
      email: _emailTextEditingController.text,
      password: _passwordTextEditingController.text,
    );
    loginResult.fold(
      (error) => {},
      (result) {
        _userModel = result;
      },
    );
  }

  Future<void> registerUser() async {
    final registerResult = await _registerUserUseCase.registerWithCredentials(
      email: _emailTextEditingController.text,
      password: _passwordTextEditingController.text,
    );
    registerResult.fold(
      (error) => {},
      (result) {
        _userModel = result;
      },
    );
  }

  Future<void> googleLogin() async {
    final googleLoginResult = await _googleLoginUseCase.googleLogin();
    googleLoginResult.fold(
      (error) => {},
      (result) {
        _userModel = result;
        _emitMain(navigation: AuthLoggedInNavigation());
      },
    );
  }

  Future<void> logout() async {
    final logoutResult = await _logoutUseCase.logout();
    logoutResult.fold(
      (error) => {},
      (result) => {},
    );
  }

  void forgotPasswordTapped() {
    // TODO: ADD NAVIGATION
  }

  void registerUserTapped() {
    // TODO: ADD NAVIGATION
  }

  void _emitMain({
    AuthViewModelNavigation? navigation,
  }) {
    emit(
      AuthMain(
        viewModel: AuthViewModel.fromSuccessState(
          user: UserEntity.fromModel(_userModel),
          navigation: navigation,
        ),
      ),
    );
  }

  @override
  Future<void> close() async {
    // TODO: ADD CLOSE
    await super.close();
  }
}