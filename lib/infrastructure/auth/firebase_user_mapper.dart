import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_todo_list/domain/auth/user_model.dart';
import 'package:flutter_todo_list/domain/core/value_objects.dart';

extension FirebaseUserDomainX on User {
  UserModel toDomain() {
    return UserModel(
      id: UniqueId.fromUniqueString(uid),
    );
  }
}
