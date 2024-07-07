import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:peruvian_recipes_flutter/core/network/api/api.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/core/network/response/login_response.dart';
import 'package:peruvian_recipes_flutter/core/network/response/registration_response.dart';

class AuthApiManager {
  final Api _api;

  AuthApiManager(this._api);

  Future<Either<ApiError, RegistrationResponse>> registerWithCredentials(
      {required String email, required String password}) async {
    try {
      final response = await _api.authApi.registerWithCredentials(
        email: email,
        password: password,
      );
      if (response.data != null) return Right(response.data!);
      return Left(ApiError.defaultError());
    } on FirebaseAuthException catch (error) {
      return Left(
        ApiError(
          errorCode: error.code,
          errorMessage: error.message,
        ),
      );
    }
  }

  Future<Either<ApiError, LoginResponse>> loginWithCredentials(
      {required String email, required String password}) async {
    try {
      final response = await _api.authApi.loginWithCredentials(
        email: email,
        password: password,
      );
      if (response.data != null) return Right(response.data!);
      return Left(ApiError.defaultError());
    } on FirebaseAuthException catch (error) {
      return Left(
        ApiError(
          errorCode: error.code,
          errorMessage: error.message,
        ),
      );
    }
  }

  Future<Either<ApiError, LoginResponse>> googleLogin() async {
    try {
      final response = await _api.authApi.googleLogin();
      if (response.data != null) return Right(response.data!);
      return Left(ApiError.defaultError());
    } on FirebaseAuthException catch (error) {
      return Left(
        ApiError(
          errorCode: error.code,
          errorMessage: error.message,
        ),
      );
    }
  }

  Future<Either<ApiError, bool>> logout() async {
    try {
      final userLogout = await _api.authApi.logout();
      return Right(userLogout);
    } catch (_) {
      return Left(ApiError.defaultError());
    }
  }
}
