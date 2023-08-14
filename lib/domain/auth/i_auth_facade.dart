import 'package:dartz/dartz.dart';
import 'package:flutter_todo_list/domain/auth/auth_failure.dart';
import 'package:flutter_todo_list/domain/auth/user_model.dart';
import 'package:flutter_todo_list/domain/auth/value_objects.dart';

abstract class IAuthFacade {
  Future<Option<UserModel>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> signOut();
}