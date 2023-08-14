import 'package:flutter_todo_list/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required UniqueId id,
}) = _UserModel;
}