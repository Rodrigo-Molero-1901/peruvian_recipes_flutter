import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/core/network/api_manager/api_manager.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/features/authentication/data/models/user_model.dart';
import 'package:peruvian_recipes_flutter/features/authentication/data/models/user_model_mapper.dart';
import 'package:peruvian_recipes_flutter/features/authentication/domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final ApiManager _apiManager;

  AuthRepositoryImpl({
    required ApiManager apiManager,
  }) : _apiManager = apiManager;

  @override
  Future<Either<ApiError, UserModel>> registerWithCredentials(
      {required String email, required String password}) async {
    final registerResponse =
        await _apiManager.authApiManager.registerWithCredentials(
      email: email,
      password: password,
    );
    return registerResponse.fold(
      (error) => Left(error),
      (registeredUser) => Right(userModelFromRegistration(registeredUser)),
    );
  }

  @override
  Future<Either<ApiError, UserModel>> loginWithCredentials(
      {required String email, required String password}) async {
    final loginResponse = await _apiManager.authApiManager.loginWithCredentials(
      email: email,
      password: password,
    );
    return loginResponse.fold(
      (error) => Left(error),
      (loggedUser) => Right(userModelFromLogin(loggedUser)),
    );
  }

  @override
  Future<Either<ApiError, UserModel>> googleLogin() async {
    final loginResponse = await _apiManager.authApiManager.googleLogin();
    return loginResponse.fold(
      (error) => Left(error),
      (loggedGoogleUser) => Right(userModelFromLogin(loggedGoogleUser)),
    );
  }

  @override
  Future<Either<bool, bool>> logout() async {
    return await _apiManager.authApiManager.logout();
  }
}
