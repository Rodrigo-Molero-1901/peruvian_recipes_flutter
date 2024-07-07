import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/features/authentication/data/models/user_model.dart';
import 'package:peruvian_recipes_flutter/features/authentication/domain/repositories/auth_repository.dart';

@injectable
class GoogleLoginUseCase {
  final AuthRepository _repository;

  GoogleLoginUseCase(this._repository);

  Future<Either<ApiError, UserModel>> googleLogin() async {
    return await _repository.googleLogin();
  }
}
