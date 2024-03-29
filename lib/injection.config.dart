// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_bloc.dart' as _i8;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i9;
import 'application/notes/note_actor/note_actor_bloc.dart' as _i12;
import 'application/notes/note_form/note_form_bloc.dart' as _i13;
import 'application/notes/note_watcher/note_watcher_bloc.dart' as _i14;
import 'domain/auth/i_auth_facade.dart' as _i6;
import 'domain/notes/i_note_repository.dart' as _i10;
import 'infrastructure/auth/firebase_auth_facade.dart' as _i7;
import 'infrastructure/core/farebase_injectable_module.dart' as _i15;
import 'infrastructure/notes/note_repository.dart' as _i11;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt initGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    gh.lazySingleton<_i3.GoogleSignIn>(
        () => firebaseInjectableModule.googleSignIn);
    gh.lazySingleton<_i4.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i5.FirebaseFirestore>(
        () => firebaseInjectableModule.firebaseFirestore);
    gh.lazySingleton<_i6.IAuthFacade>(() => _i7.FirebaseAuthFacade(
          gh<_i4.FirebaseAuth>(),
          gh<_i3.GoogleSignIn>(),
        ));
    gh.factory<_i8.AuthBloc>(() => _i8.AuthBloc(gh<_i6.IAuthFacade>()));
    gh.factory<_i9.SignInFormBloc>(
        () => _i9.SignInFormBloc(gh<_i6.IAuthFacade>()));
    gh.lazySingleton<_i10.INoteRepository>(
        () => _i11.NoteRepository(gh<_i5.FirebaseFirestore>()));
    gh.factory<_i12.NoteActorBloc>(
        () => _i12.NoteActorBloc(gh<_i10.INoteRepository>()));
    gh.factory<_i13.NoteFormBloc>(
        () => _i13.NoteFormBloc(gh<_i10.INoteRepository>()));
    gh.factory<_i14.NoteWatcherBloc>(
        () => _i14.NoteWatcherBloc(gh<_i10.INoteRepository>()));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i15.FirebaseInjectableModule {}
