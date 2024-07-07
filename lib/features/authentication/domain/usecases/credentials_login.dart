import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/features/authentication/data/models/user_model.dart';
import 'package:peruvian_recipes_flutter/features/authentication/domain/repositories/auth_repository.dart';

@injectable
class CredentialsLoginUseCase {
  final AuthRepository _repository;

  CredentialsLoginUseCase(this._repository);

  Future<Either<ApiError, UserModel>> loginWithCredentials(
      {required String email, required String password}) async {
    return await _repository.loginWithCredentials(
      email: email,
      password: password,
    );
  }
}
