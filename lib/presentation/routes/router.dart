import 'package:auto_route/annotations.dart';
// ignore: implementation_imports
import 'package:auto_route/src/route/auto_route_config.dart';
import './router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(page: NotesOverViewRoute.page),
    AutoRoute(page: NoteFormRoute.page, fullscreenDialog: true),
  ];
}