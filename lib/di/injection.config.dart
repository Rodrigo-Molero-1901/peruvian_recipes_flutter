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
    as _i11;
import '../features/authentication/domain/repositories/auth_repository.dart'
    as _i10;
import '../features/authentication/domain/usecases/credentials_login.dart'
    as _i15;
import '../features/authentication/domain/usecases/google_login.dart' as _i17;
import '../features/authentication/domain/usecases/logout.dart' as _i18;
import '../features/authentication/domain/usecases/register_user.dart' as _i16;
import '../features/authentication/presentation/blocs/auth_cubit.dart' as _i19;
import '../features/detailed_recipe/data/repositories/detailed_recipe_repository_impl.dart'
    as _i7;
import '../features/detailed_recipe/domain/repositories/detailed_recipe_repository.dart'
    as _i6;
import '../features/detailed_recipe/domain/usecases/get_recipe_details.dart'
    as _i25;
import '../features/detailed_recipe/domain/usecases/remove_from_favorite.dart'
    as _i26;
import '../features/detailed_recipe/domain/usecases/save_to_favorite.dart'
    as _i24;
import '../features/detailed_recipe/presentation/blocs/detailed_recipe_cubit.dart'
    as _i27;
import '../features/home/data/repositories/carousel_repository_impl.dart'
    as _i14;
import '../features/home/data/repositories/category_repository_impl.dart'
    as _i9;
import '../features/home/domain/repositories/carousel_repository.dart' as _i13;
import '../features/home/domain/repositories/category_repository.dart' as _i8;
import '../features/home/domain/usecases/get_carousel.dart' as _i22;
import '../features/home/domain/usecases/get_categories.dart' as _i12;
import '../features/home/presentation/blocs/home_cubit.dart' as _i23;
import '../features/recipes_list/data/repositories/recipe_repository_impl.dart'
    as _i5;
import '../features/recipes_list/domain/repositories/recipes_list_repository.dart'
    as _i4;
import '../features/recipes_list/domain/usecases/get_favorite_recipes.dart'
    as _i21;
import '../features/recipes_list/domain/usecases/get_recipes.dart' as _i20;
import '../features/recipes_list/presentation/blocs/recipes_list_cubit.dart'
    as _i28;

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
    gh.factory<_i4.RecipesListRepository>(
        () => _i5.RecipeRepositoryImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i6.DetailedRecipeRepository>(() =>
        _i7.DetailedRecipeRepositoryImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i8.CategoryRepository>(
        () => _i9.CategoryRepositoryImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i10.AuthRepository>(
        () => _i11.AuthRepositoryImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i12.GetCategoriesUseCase>(
        () => _i12.GetCategoriesUseCase(gh<_i8.CategoryRepository>()));
    gh.factory<_i13.CarouselRepository>(
        () => _i14.CarouselRepositoryImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i15.CredentialsLoginUseCase>(
        () => _i15.CredentialsLoginUseCase(gh<_i10.AuthRepository>()));
    gh.factory<_i16.RegisterUserUseCase>(
        () => _i16.RegisterUserUseCase(gh<_i10.AuthRepository>()));
    gh.factory<_i17.GoogleLoginUseCase>(
        () => _i17.GoogleLoginUseCase(gh<_i10.AuthRepository>()));
    gh.factory<_i18.LogoutUseCase>(
        () => _i18.LogoutUseCase(gh<_i10.AuthRepository>()));
    gh.factory<_i19.AuthCubit>(() => _i19.AuthCubit(
          registerUserUseCase: gh<_i16.RegisterUserUseCase>(),
          credentialsLoginUseCase: gh<_i15.CredentialsLoginUseCase>(),
          googleLoginUseCase: gh<_i17.GoogleLoginUseCase>(),
          logoutUseCase: gh<_i18.LogoutUseCase>(),
        ));
    gh.factory<_i20.GetRecipesUseCase>(
        () => _i20.GetRecipesUseCase(gh<_i4.RecipesListRepository>()));
    gh.factory<_i21.GetFavoriteRecipesUseCase>(
        () => _i21.GetFavoriteRecipesUseCase(gh<_i4.RecipesListRepository>()));
    gh.factory<_i22.GetCarouselUseCase>(
        () => _i22.GetCarouselUseCase(gh<_i13.CarouselRepository>()));
    gh.factory<_i23.HomeCubit>(() => _i23.HomeCubit(
          getCarouselUseCase: gh<_i22.GetCarouselUseCase>(),
          getCategoriesUseCase: gh<_i12.GetCategoriesUseCase>(),
        ));
    gh.factory<_i24.SaveToFavoriteUseCase>(
        () => _i24.SaveToFavoriteUseCase(gh<_i6.DetailedRecipeRepository>()));
    gh.factory<_i25.GetRecipeDetailsUseCase>(
        () => _i25.GetRecipeDetailsUseCase(gh<_i6.DetailedRecipeRepository>()));
    gh.factory<_i26.RemoveFromFavoriteUseCase>(() =>
        _i26.RemoveFromFavoriteUseCase(gh<_i6.DetailedRecipeRepository>()));
    gh.factory<_i27.DetailedRecipeCubit>(() => _i27.DetailedRecipeCubit(
          getRecipeDetailsUseCase: gh<_i25.GetRecipeDetailsUseCase>(),
          saveToFavoriteUseCase: gh<_i24.SaveToFavoriteUseCase>(),
        ));
    gh.factory<_i28.RecipesListCubit>(() => _i28.RecipesListCubit(
          getRecipesUseCase: gh<_i20.GetRecipesUseCase>(),
          getFavoriteRecipesUseCase: gh<_i21.GetFavoriteRecipesUseCase>(),
        ));
    return this;
  }
}
