import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:peruvian_recipes_flutter/core/network/response/base_response.dart';
import 'package:peruvian_recipes_flutter/core/network/response/login_response.dart';
import 'package:peruvian_recipes_flutter/core/network/response/registration_response.dart';
import 'package:peruvian_recipes_flutter/shared/constants/app_firebase_constants.dart';

class AuthApi {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  AuthApi(
    this._firebaseAuth,
    this._firebaseFirestore,
  );

  Future<Response<RegistrationResponse>> registerWithCredentials(
      {required String email, required String password}) async {
    RegistrationResponse? responseData;
    try {
      final response = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      responseData = RegistrationResponse.fromUserCredential(response);
      await _createUserInDatabase(response.user);
    } on FirebaseAuthException catch (_) {
      rethrow;
    }
    return Response<RegistrationResponse>(
      data: responseData,
    );
  }

  Future<Response<LoginResponse>> loginWithCredentials(
      {required String email, required String password}) async {
    LoginResponse? responseData;
    try {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      responseData = LoginResponse.fromUserCredential(response);
      await _createUserInDatabase(response.user);
    } on FirebaseAuthException catch (_) {
      rethrow;
    }
    return Response<LoginResponse>(
      data: responseData,
    );
  }

  Future<Response<LoginResponse>> googleLogin() async {
    LoginResponse? responseData;
    try {
      final googleUser = await GoogleSignIn(scopes: ['email']).signIn();
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final googleCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final response = await _firebaseAuth.signInWithCredential(
          googleCredential,
        );
        responseData = LoginResponse.fromUserCredential(response);
        await _createUserInDatabase(response.user);
      }
    } on FirebaseAuthException catch (_) {
      rethrow;
    }
    return Response<LoginResponse>(
      data: responseData,
    );
  }

  Future<void> _createUserInDatabase(User? user) async {
    if (user != null) {
      final DocumentReference userDocument = _firebaseFirestore
          .collection(AppFirebaseConstants.usersCollection)
          .doc(user.uid);
      final DocumentSnapshot docSnapshot = await userDocument.get();
      if (!docSnapshot.exists) {
        await userDocument.set(<String, dynamic>{});
      }
    }
  }

  Future<bool> logout() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (_) {
      rethrow;
    }
  }
}
