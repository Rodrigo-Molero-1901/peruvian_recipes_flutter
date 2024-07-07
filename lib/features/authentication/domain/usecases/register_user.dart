import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/features/authentication/data/models/user_model.dart';
import 'package:peruvian_recipes_flutter/features/authentication/domain/repositories/auth_repository.dart';

@injectable
class RegisterUserUseCase {
  final AuthRepository _repository;

  RegisterUserUseCase(this._repository);

  Future<Either<ApiError, UserModel>> registerWithCredentials(
      {required String email, required String password}) async {
    return await _repository.registerWithCredentials(
      email: email,
      password: password,
    );
  }
}
