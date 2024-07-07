import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/di/injection.config.dart';

final injector = GetIt.instance;

@InjectableInit(preferRelativeImports: true)
Future<void> configureDependencies() async => injector.init();
