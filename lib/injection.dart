import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_todo_list/injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'initGetIt',
  preferRelativeImports: true,
  asExtension: true
)
void configureInjection(String env) => getIt.initGetIt(environment: env);
