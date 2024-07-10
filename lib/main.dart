import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:peruvian_recipes_flutter/core/router/router.dart';
import 'package:peruvian_recipes_flutter/core/utils/firebase_options.dart';
import 'package:peruvian_recipes_flutter/di/injection.dart';
import 'package:peruvian_recipes_flutter/features/authentication/domain/entitites/user.dart';
import 'package:peruvian_recipes_flutter/features/authentication/presentation/blocs/auth_cubit.dart';
import 'package:peruvian_recipes_flutter/features/authentication/presentation/views/auth_view.dart';
import 'package:peruvian_recipes_flutter/features/home/domain/entitites/most_liked_recipe.dart';
import 'package:peruvian_recipes_flutter/features/home/presentation/blocs/home_cubit.dart';
import 'package:peruvian_recipes_flutter/features/home/presentation/views/home_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => injector<AuthCubit>()),
        BlocProvider<HomeCubit>(create: (_) => injector<HomeCubit>()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: GoRouter(
          initialLocation: Routes.pathAuth,
          routes: [
            GoRoute(
              path: Routes.pathAuth,
              name: Routes.nameAuth,
              builder: (context, state) {
                return const AuthView();
              },
            ),
            GoRoute(
              path: Routes.pathHome,
              name: Routes.nameHome,
              builder: (context, state) {
                final user = state.extra! as UserEntity;
                return HomeView(
                  user: user,
                );
              },
            ),
            GoRoute(
              path: Routes.pathRecipe,
              name: Routes.nameRecipe,
              builder: (context, state) {
                final recipe = state.extra! as MostLikedRecipeEntity;
                return const Scaffold(
                  body: Center(
                    child: Text('Estamos en el detalle de la receta'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
