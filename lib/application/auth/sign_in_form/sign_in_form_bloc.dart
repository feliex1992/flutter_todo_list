import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_todo_list/domain/auth/auth_failure.dart';
import 'package:flutter_todo_list/domain/auth/i_auth_facade.dart';
import 'package:flutter_todo_list/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) async {
      if (event is EmailChanged) {
        emit(state.copyWith(
          emailAddress: EmailAddress(event.emailStr),
          authFailureOrSuccessOption: none(),
        ));
      } else if (event is PasswordChanged) {
        emit(state.copyWith(
          password: Password(event.passwordStr),
          authFailureOrSuccessOption: none(),
        ));
      } else if (event is RegisterWithEmailAndPasswordPressed) {
        await _performActionOnAuthFacadeWithEmailAndPassword(
          emit,
          _authFacade.registerWithEmailAndPassword,
        );
      } else if (event is SignInWithEmailAndPasswordPressed) {
        await _performActionOnAuthFacadeWithEmailAndPassword(
          emit,
          _authFacade.signInWithEmailAndPassword,
        );
      } else if (event is SignInWithGooglePressed) {
        emit(state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ));
        final failureOrSuccess = await _authFacade.signInWithGoogle();
        emit(state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: some(failureOrSuccess),
        ));
      }
    });
  }

  _performActionOnAuthFacadeWithEmailAndPassword(
    Emitter<SignInFormState> emit,
    Future<Either<AuthFailure, Unit>> Function({
      required EmailAddress emailAddress,
      required Password password,
    }) forwardedCall,
  ) async {
    Either<AuthFailure, Unit>? failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));
      failureOrSuccess = await forwardedCall(
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }
    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }
}
