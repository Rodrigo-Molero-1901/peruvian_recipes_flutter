import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/core/network/error/api_error.dart';
import 'package:peruvian_recipes_flutter/features/authentication/domain/repositories/auth_repository.dart';

@injectable
class LogoutUseCase {
  final AuthRepository _repository;

  LogoutUseCase(this._repository);

  Future<Either<ApiError, bool>> logout() async {
    return await _repository.logout();
  }
}
