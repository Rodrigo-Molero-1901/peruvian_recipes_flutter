import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:peruvian_recipes_flutter/core/network/api/auth_api.dart';

class Api {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  Api(
    this._firebaseAuth,
    this._firebaseFirestore,
  );

  AuthApi get authApi {
    return AuthApi(_firebaseAuth, _firebaseFirestore);
  }
}
