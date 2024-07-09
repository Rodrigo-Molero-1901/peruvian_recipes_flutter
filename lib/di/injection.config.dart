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
import '../features/authentication/data/repositories/auth_repository_impl.dart'
    as _i7;
import '../features/authentication/domain/repositories/auth_repository.dart'
    as _i6;
import '../features/authentication/domain/usecases/credentials_login.dart'
    as _i11;
import '../features/authentication/domain/usecases/google_login.dart' as _i13;
import '../features/authentication/domain/usecases/logout.dart' as _i14;
import '../features/authentication/domain/usecases/register_user.dart' as _i12;
import '../features/authentication/presentation/blocs/auth_cubit.dart' as _i15;
import '../features/home/data/repositories/carousel_repository_impl.dart'
    as _i10;
import '../features/home/data/repositories/category_repository_impl.dart'
    as _i5;
import '../features/home/domain/repositories/carousel_repository.dart' as _i9;
import '../features/home/domain/repositories/category_repository.dart' as _i4;
import '../features/home/domain/usecases/get_carousel.dart' as _i16;
import '../features/home/domain/usecases/get_categories.dart' as _i8;
import '../features/home/presentation/blocs/home_cubit.dart' as _i17;

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
    gh.factory<_i4.CategoryRepository>(
        () => _i5.CategoryRepositoryImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i6.AuthRepository>(
        () => _i7.AuthRepositoryImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i8.GetCategoriesUseCase>(
        () => _i8.GetCategoriesUseCase(gh<_i4.CategoryRepository>()));
    gh.factory<_i9.CarouselRepository>(
        () => _i10.CarouselRepositoryImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i11.CredentialsLoginUseCase>(
        () => _i11.CredentialsLoginUseCase(gh<_i6.AuthRepository>()));
    gh.factory<_i12.RegisterUserUseCase>(
        () => _i12.RegisterUserUseCase(gh<_i6.AuthRepository>()));
    gh.factory<_i13.GoogleLoginUseCase>(
        () => _i13.GoogleLoginUseCase(gh<_i6.AuthRepository>()));
    gh.factory<_i14.LogoutUseCase>(
        () => _i14.LogoutUseCase(gh<_i6.AuthRepository>()));
    gh.factory<_i15.AuthCubit>(() => _i15.AuthCubit(
          registerUserUseCase: gh<_i12.RegisterUserUseCase>(),
          credentialsLoginUseCase: gh<_i11.CredentialsLoginUseCase>(),
          googleLoginUseCase: gh<_i13.GoogleLoginUseCase>(),
          logoutUseCase: gh<_i14.LogoutUseCase>(),
        ));
    gh.factory<_i16.GetCarouselUseCase>(
        () => _i16.GetCarouselUseCase(gh<_i9.CarouselRepository>()));
    gh.factory<_i17.HomeCubit>(() => _i17.HomeCubit(
          getCarouselUseCase: gh<_i16.GetCarouselUseCase>(),
          getCategoriesUseCase: gh<_i8.GetCategoriesUseCase>(),
        ));
    return this;
  }
}
