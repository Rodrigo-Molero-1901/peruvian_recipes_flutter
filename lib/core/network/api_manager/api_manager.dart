import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:peruvian_recipes_flutter/core/network/api/api.dart';
import 'package:peruvian_recipes_flutter/core/network/api_manager/auth_api_manager.dart';
import 'package:peruvian_recipes_flutter/core/network/api_manager/recipe_api_manager.dart';

@injectable
class ApiManager {
  late Api _api;

  ApiManager() {
    _api = Api(
      FirebaseAuth.instance,
      FirebaseFirestore.instance,
    );
  }

  AuthApiManager get authApiManager => AuthApiManager(_api);

  RecipeApiManager get recipesApiManager => RecipeApiManager(_api);
}
