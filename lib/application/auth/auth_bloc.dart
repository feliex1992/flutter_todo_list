import 'package:bloc/bloc.dart';
import 'package:flutter_todo_list/domain/auth/i_auth_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;

  AuthBloc(this._authFacade) : super(const Initial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckRequested) {
        final userOption = await _authFacade.getSignedInUser();
        emit(userOption.fold(
          () => const AuthState.unauthenticated(),
          (r) => const AuthState.authenticated(),
        ));
      } else if (event is SignedOut) {
        await _authFacade.signOut();
        emit(const AuthState.unauthenticated());
      }
    });
  }
}
