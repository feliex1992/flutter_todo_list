// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_item_presentation_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TodoItemPrimitive {
  UniqueId get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoItemPrimitiveCopyWith<TodoItemPrimitive> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoItemPrimitiveCopyWith<$Res> {
  factory $TodoItemPrimitiveCopyWith(
          TodoItemPrimitive value, $Res Function(TodoItemPrimitive) then) =
      _$TodoItemPrimitiveCopyWithImpl<$Res, TodoItemPrimitive>;
  @useResult
  $Res call({UniqueId id, String? name, bool done});
}

/// @nodoc
class _$TodoItemPrimitiveCopyWithImpl<$Res, $Val extends TodoItemPrimitive>
    implements $TodoItemPrimitiveCopyWith<$Res> {
  _$TodoItemPrimitiveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? done = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoItemPrimitiveImplCopyWith<$Res>
    implements $TodoItemPrimitiveCopyWith<$Res> {
  factory _$$TodoItemPrimitiveImplCopyWith(_$TodoItemPrimitiveImpl value,
          $Res Function(_$TodoItemPrimitiveImpl) then) =
      __$$TodoItemPrimitiveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UniqueId id, String? name, bool done});
}

/// @nodoc
class __$$TodoItemPrimitiveImplCopyWithImpl<$Res>
    extends _$TodoItemPrimitiveCopyWithImpl<$Res, _$TodoItemPrimitiveImpl>
    implements _$$TodoItemPrimitiveImplCopyWith<$Res> {
  __$$TodoItemPrimitiveImplCopyWithImpl(_$TodoItemPrimitiveImpl _value,
      $Res Function(_$TodoItemPrimitiveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? done = null,
  }) {
    return _then(_$TodoItemPrimitiveImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TodoItemPrimitiveImpl extends _TodoItemPrimitive {
  const _$TodoItemPrimitiveImpl(
      {required this.id, this.name, required this.done})
      : super._();

  @override
  final UniqueId id;
  @override
  final String? name;
  @override
  final bool done;

  @override
  String toString() {
    return 'TodoItemPrimitive(id: $id, name: $name, done: $done)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoItemPrimitiveImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.done, done) || other.done == done));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, done);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoItemPrimitiveImplCopyWith<_$TodoItemPrimitiveImpl> get copyWith =>
      __$$TodoItemPrimitiveImplCopyWithImpl<_$TodoItemPrimitiveImpl>(
          this, _$identity);
}

abstract class _TodoItemPrimitive extends TodoItemPrimitive {
  const factory _TodoItemPrimitive(
      {required final UniqueId id,
      final String? name,
      required final bool done}) = _$TodoItemPrimitiveImpl;
  const _TodoItemPrimitive._() : super._();

  @override
  UniqueId get id;
  @override
  String? get name;
  @override
  bool get done;
  @override
  @JsonKey(ignore: true)
  _$$TodoItemPrimitiveImplCopyWith<_$TodoItemPrimitiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
