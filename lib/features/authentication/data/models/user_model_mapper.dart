import 'package:firebase_auth/firebase_auth.dart';
import 'package:peruvian_recipes_flutter/core/network/response/login_response.dart';
import 'package:peruvian_recipes_flutter/core/network/response/registration_response.dart';
import 'package:peruvian_recipes_flutter/features/authentication/data/models/user_model.dart';

UserModel userModelFromRegistration(RegistrationResponse response) {
  return UserModel(
    displayName: response.displayName,
    email: response.email,
  );
}

UserModel userModelFromLogin(LoginResponse response) {
  return UserModel(
    displayName: response.displayName,
    email: response.email,
    photoURL: response.photoURL,
  );
}

UserModel userModelFromFirebaseUser(User user) {
  return UserModel(
    displayName: user.displayName,
    email: user.email,
    photoURL: user.photoURL,
  );
}
