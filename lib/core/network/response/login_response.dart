import 'package:firebase_auth/firebase_auth.dart';

class LoginResponse {
  String? id;
  String? displayName;
  String? email;
  String? photoURL;

  LoginResponse({
    this.id,
    this.displayName,
    this.email,
    this.photoURL,
  });

  factory LoginResponse.fromUserCredential(UserCredential credential) {
    return LoginResponse(
      id: credential.user?.uid,
      displayName: credential.user?.displayName,
      email: credential.user?.email,
      photoURL: credential.user?.photoURL,
    );
  }
}
