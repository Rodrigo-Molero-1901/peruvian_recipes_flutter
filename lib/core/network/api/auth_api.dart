import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:peruvian_recipes_flutter/core/network/response/base_response.dart';
import 'package:peruvian_recipes_flutter/core/network/response/login_response.dart';
import 'package:peruvian_recipes_flutter/core/network/response/registration_response.dart';

class AuthApi {
  final FirebaseAuth _firebaseAuth;

  AuthApi(this._firebaseAuth);

  Future<Response<RegistrationResponse>> registerWithCredentials(
      {required String email, required String password}) async {
    RegistrationResponse? responseData;

    try {
      final response = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      responseData?.id = response.user?.uid;
      responseData?.displayName = response.user?.displayName;
      responseData?.email = response.user?.email;
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
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final googleCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final response = await _firebaseAuth.signInWithCredential(
        googleCredential,
      );
      responseData = LoginResponse.fromUserCredential(response);
    } on FirebaseAuthException catch (_) {
      rethrow;
    }

    return Response<LoginResponse>(
      data: responseData,
    );
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
