// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:flutter_todo_list/domain/notes/note.dart' as _i7;
import 'package:flutter_todo_list/presentation/notes/note_form/note_form_page.dart'
    as _i1;
import 'package:flutter_todo_list/presentation/notes/notes_overview/notes_overview_page.dart'
    as _i2;
import 'package:flutter_todo_list/presentation/sign_in/sign_in_page.dart'
    as _i3;
import 'package:flutter_todo_list/presentation/splash/splash_page.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    NoteFormRoute.name: (routeData) {
      final args = routeData.argsAs<NoteFormRouteArgs>(
          orElse: () => const NoteFormRouteArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.NoteFormPage(
          key: args.key,
          editedNote: args.editedNote,
        ),
      );
    },
    NotesOverViewRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.NotesOverViewPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignInPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.NoteFormPage]
class NoteFormRoute extends _i5.PageRouteInfo<NoteFormRouteArgs> {
  NoteFormRoute({
    _i6.Key? key,
    _i7.Note? editedNote,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          NoteFormRoute.name,
          args: NoteFormRouteArgs(
            key: key,
            editedNote: editedNote,
          ),
          initialChildren: children,
        );

  static const String name = 'NoteFormRoute';

  static const _i5.PageInfo<NoteFormRouteArgs> page =
      _i5.PageInfo<NoteFormRouteArgs>(name);
}

class NoteFormRouteArgs {
  const NoteFormRouteArgs({
    this.key,
    this.editedNote,
  });

  final _i6.Key? key;

  final _i7.Note? editedNote;

  @override
  String toString() {
    return 'NoteFormRouteArgs{key: $key, editedNote: $editedNote}';
  }
}

/// generated route for
/// [_i2.NotesOverViewPage]
class NotesOverViewRoute extends _i5.PageRouteInfo<void> {
  const NotesOverViewRoute({List<_i5.PageRouteInfo>? children})
      : super(
          NotesOverViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotesOverViewRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SignInPage]
class SignInRoute extends _i5.PageRouteInfo<void> {
  const SignInRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
