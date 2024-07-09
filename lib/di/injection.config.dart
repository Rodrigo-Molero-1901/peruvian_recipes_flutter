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
    as _i8;
import '../features/authentication/domain/repositories/auth_repository.dart'
    as _i7;
import '../features/authentication/domain/usecases/credentials_login.dart'
    as _i12;
import '../features/authentication/domain/usecases/google_login.dart' as _i14;
import '../features/authentication/domain/usecases/logout.dart' as _i15;
import '../features/authentication/domain/usecases/register_user.dart' as _i13;
import '../features/authentication/presentation/blocs/auth_cubit.dart' as _i16;
import '../features/home/data/repositories/carousel_repository_impl.dart'
    as _i11;
import '../features/home/data/repositories/category_repository_impl.dart'
    as _i6;
import '../features/home/domain/repositories/carousel_repository.dart' as _i10;
import '../features/home/domain/repositories/category_repository.dart' as _i5;
import '../features/home/domain/usecases/get_carousel.dart' as _i17;
import '../features/home/domain/usecases/get_categories.dart' as _i9;
import '../features/home/presentation/blocs/home_cubit.dart' as _i18;

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
    gh.factory<_i5.CategoryRepository>(
        () => _i6.CategoryRepositoryImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i7.AuthRepository>(
        () => _i8.AuthRepositoryImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i9.GetCategoriesUseCase>(
        () => _i9.GetCategoriesUseCase(gh<_i5.CategoryRepository>()));
    gh.factory<_i10.CarouselRepository>(
        () => _i11.CarouselRepositoryImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i12.CredentialsLoginUseCase>(
        () => _i12.CredentialsLoginUseCase(gh<_i7.AuthRepository>()));
    gh.factory<_i13.RegisterUserUseCase>(
        () => _i13.RegisterUserUseCase(gh<_i7.AuthRepository>()));
    gh.factory<_i14.GoogleLoginUseCase>(
        () => _i14.GoogleLoginUseCase(gh<_i7.AuthRepository>()));
    gh.factory<_i15.LogoutUseCase>(
        () => _i15.LogoutUseCase(gh<_i7.AuthRepository>()));
    gh.factory<_i16.AuthCubit>(() => _i16.AuthCubit(
          registerUserUseCase: gh<_i13.RegisterUserUseCase>(),
          credentialsLoginUseCase: gh<_i12.CredentialsLoginUseCase>(),
          googleLoginUseCase: gh<_i14.GoogleLoginUseCase>(),
          logoutUseCase: gh<_i15.LogoutUseCase>(),
        ));
    gh.factory<_i17.GetCarouselUseCase>(
        () => _i17.GetCarouselUseCase(gh<_i10.CarouselRepository>()));
    gh.factory<_i18.HomeCubit>(() => _i18.HomeCubit(
          getCarouselUseCase: gh<_i17.GetCarouselUseCase>(),
          getCategoriesUseCase: gh<_i9.GetCategoriesUseCase>(),
        ));
    return this;
  }
}
