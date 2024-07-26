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
    as _i9;
import '../features/authentication/domain/repositories/auth_repository.dart'
    as _i8;
import '../features/authentication/domain/usecases/credentials_login.dart'
    as _i13;
import '../features/authentication/domain/usecases/google_login.dart' as _i15;
import '../features/authentication/domain/usecases/logout.dart' as _i16;
import '../features/authentication/domain/usecases/register_user.dart' as _i14;
import '../features/authentication/presentation/blocs/auth_cubit.dart' as _i17;
import '../features/home/data/repositories/carousel_repository_impl.dart'
    as _i12;
import '../features/home/data/repositories/category_repository_impl.dart'
    as _i7;
import '../features/home/domain/repositories/carousel_repository.dart' as _i11;
import '../features/home/domain/repositories/category_repository.dart' as _i6;
import '../features/home/domain/usecases/get_carousel.dart' as _i18;
import '../features/home/domain/usecases/get_categories.dart' as _i10;
import '../features/home/presentation/blocs/home_cubit.dart' as _i19;
import '../features/recipe/data/repositories/recipe_repository_impl.dart'
    as _i5;
import '../features/recipe/domain/repositories/recipe_repository.dart' as _i4;
import '../features/recipe/domain/usecases/get_recipe_details.dart' as _i20;
import '../features/recipe/domain/usecases/get_recipes.dart' as _i21;
import '../features/recipe/domain/usecases/save_favorite_recipe.dart' as _i22;
import '../features/recipe/presentation/blocs/recipe_details/recipe_details_cubit.dart'
    as _i24;
import '../features/recipe/presentation/blocs/recipes_list/recipes_list_cubit.dart'
    as _i23;

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
    gh.factory<_i4.RecipeRepository>(
        () => _i5.RecipeRepositoryImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i6.CategoryRepository>(
        () => _i7.CategoryRepositoryImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i8.AuthRepository>(
        () => _i9.AuthRepositoryImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i10.GetCategoriesUseCase>(
        () => _i10.GetCategoriesUseCase(gh<_i6.CategoryRepository>()));
    gh.factory<_i11.CarouselRepository>(
        () => _i12.CarouselRepositoryImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i13.CredentialsLoginUseCase>(
        () => _i13.CredentialsLoginUseCase(gh<_i8.AuthRepository>()));
    gh.factory<_i14.RegisterUserUseCase>(
        () => _i14.RegisterUserUseCase(gh<_i8.AuthRepository>()));
    gh.factory<_i15.GoogleLoginUseCase>(
        () => _i15.GoogleLoginUseCase(gh<_i8.AuthRepository>()));
    gh.factory<_i16.LogoutUseCase>(
        () => _i16.LogoutUseCase(gh<_i8.AuthRepository>()));
    gh.factory<_i17.AuthCubit>(() => _i17.AuthCubit(
          registerUserUseCase: gh<_i14.RegisterUserUseCase>(),
          credentialsLoginUseCase: gh<_i13.CredentialsLoginUseCase>(),
          googleLoginUseCase: gh<_i15.GoogleLoginUseCase>(),
          logoutUseCase: gh<_i16.LogoutUseCase>(),
        ));
    gh.factory<_i18.GetCarouselUseCase>(
        () => _i18.GetCarouselUseCase(gh<_i11.CarouselRepository>()));
    gh.factory<_i19.HomeCubit>(() => _i19.HomeCubit(
          getCarouselUseCase: gh<_i18.GetCarouselUseCase>(),
          getCategoriesUseCase: gh<_i10.GetCategoriesUseCase>(),
        ));
    gh.factory<_i20.GetRecipeDetailsUseCase>(
        () => _i20.GetRecipeDetailsUseCase(gh<_i4.RecipeRepository>()));
    gh.factory<_i21.GetRecipesUseCase>(
        () => _i21.GetRecipesUseCase(gh<_i4.RecipeRepository>()));
    gh.factory<_i22.SaveFavoriteRecipeUseCase>(
        () => _i22.SaveFavoriteRecipeUseCase(gh<_i4.RecipeRepository>()));
    gh.factory<_i23.RecipesListCubit>(() =>
        _i23.RecipesListCubit(getRecipesUseCase: gh<_i21.GetRecipesUseCase>()));
    gh.factory<_i24.RecipeDetailsCubit>(() => _i24.RecipeDetailsCubit(
          getRecipeDetailsUseCase: gh<_i20.GetRecipeDetailsUseCase>(),
          saveFavoriteRecipeUseCase: gh<_i22.SaveFavoriteRecipeUseCase>(),
        ));
    return this;
  }
}
