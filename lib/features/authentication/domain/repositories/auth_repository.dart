import 'package:fpdart/fpdart.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/features/authentication/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<ApiError, UserModel>> registerWithCredentials(
      {required String email, required String password});

  Future<Either<ApiError, UserModel>> loginWithCredentials(
      {required String email, required String password});

  Future<Either<ApiError, UserModel>> googleLogin();

  Future<Either<ApiError, bool>> logout();
}
