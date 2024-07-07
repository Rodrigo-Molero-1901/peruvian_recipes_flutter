import 'package:firebase_auth/firebase_auth.dart';
import 'package:peruvian_recipes_flutter/core/network/api/auth_api.dart';

class Api {
  final FirebaseAuth _firebaseAuth;

  Api(
    this._firebaseAuth,
  );

  AuthApi get authApi {
    return AuthApi(_firebaseAuth);
  }
}
