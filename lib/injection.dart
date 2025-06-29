import 'package:get_it/get_it.dart';
import 'package:indrive_client/injection.config.dart';
import 'package:injectable/injectable.dart';

final locator = GetIt.instance;
@injectableInit
Future<void> configureDependencies() async => await locator.init();
