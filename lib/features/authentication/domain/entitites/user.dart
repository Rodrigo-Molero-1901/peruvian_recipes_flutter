import 'package:peruvian_recipes_flutter/features/authentication/data/models/user_model.dart';
import 'package:peruvian_recipes_flutter/shared/extensions/string_extension.dart';

class UserEntity {
  final String displayName;
  final String email;
  final String photoURL;

  UserEntity({
    required this.displayName,
    required this.email,
    required this.photoURL,
  });

  factory UserEntity.fromModel(UserModel model) {
    return UserEntity(
      displayName: model.displayName.safe,
      email: model.email.safe,
      photoURL: model.photoURL.safe,
    );
  }
}
