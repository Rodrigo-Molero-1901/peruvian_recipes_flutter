import 'package:firebase_auth/firebase_auth.dart';

class RegistrationResponse {
  String? id;
  String? displayName;
  String? email;

  RegistrationResponse({
    this.id,
    this.displayName,
    this.email,
  });

  factory RegistrationResponse.fromUserCredential(UserCredential credential) {
    return RegistrationResponse(
      id: credential.user?.uid,
      displayName: credential.user?.displayName,
      email: credential.user?.email,
    );
  }
}
