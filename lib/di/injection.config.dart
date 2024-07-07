// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/network/api_manager/api_manager.dart' as _i3;
import '../core/utils/connectivity_checker.dart' as _i4;
import '../features/authentication/data/repositories/auth_repository_impl.dart'
    as _i6;
import '../features/authentication/domain/repositories/auth_repository.dart'
    as _i5;
import '../features/authentication/domain/usecases/credentials_login.dart'
    as _i7;
import '../features/authentication/domain/usecases/google_login.dart' as _i9;
import '../features/authentication/domain/usecases/logout.dart' as _i10;
import '../features/authentication/domain/usecases/register_user.dart' as _i8;
import '../features/authentication/presentation/blocs/auth_cubit.dart' as _i11;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.ConnectivityChecker>(() => _i4.ConnectivityChecker());
    gh.factory<_i5.AuthRepository>(
        () => _i6.AuthRepositoryImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i7.CredentialsLoginUseCase>(
        () => _i7.CredentialsLoginUseCase(gh<_i5.AuthRepository>()));
    gh.factory<_i8.RegisterUserUseCase>(
        () => _i8.RegisterUserUseCase(gh<_i5.AuthRepository>()));
    gh.factory<_i9.GoogleLoginUseCase>(
        () => _i9.GoogleLoginUseCase(gh<_i5.AuthRepository>()));
    gh.factory<_i10.LogoutUseCase>(
        () => _i10.LogoutUseCase(gh<_i5.AuthRepository>()));
    gh.factory<_i11.AuthCubit>(() => _i11.AuthCubit(
          registerUserUseCase: gh<_i8.RegisterUserUseCase>(),
          credentialsLoginUseCase: gh<_i7.CredentialsLoginUseCase>(),
          googleLoginUseCase: gh<_i9.GoogleLoginUseCase>(),
          logoutUseCase: gh<_i10.LogoutUseCase>(),
        ));
    return this;
  }
}
