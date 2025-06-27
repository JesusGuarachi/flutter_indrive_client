import 'package:indrive_client/data/data_source/local/shared_pref.dart';
import 'package:indrive_client/data/data_source/remote/services/auth_service.dart';
import 'package:indrive_client/data/repository/auth_repository_impl.dart';
import 'package:indrive_client/domain/repository/auth_repository.dart';
import 'package:indrive_client/domain/use_cases/auth/auth_use_cases.dart';
import 'package:indrive_client/domain/use_cases/auth/get_user_session_use_case.dart';
import 'package:indrive_client/domain/use_cases/auth/login_use_case.dart';
import 'package:indrive_client/domain/use_cases/auth/register_use_case.dart';
import 'package:indrive_client/domain/use_cases/auth/save_user_session_use_case.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @injectable
  SharedPref get sharedPref => SharedPref();
  @injectable
  AuthService get authService => AuthService();
  @injectable
  AuthRepository get authRepository =>
      AuthRepositoryImpl(authService: authService, sharedPref: sharedPref);
  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
    login: LoginUseCase(repository: authRepository),
    register: RegisterUseCase(repository: authRepository),
    saveUserSession: SaveUserSessionUseCase(authRepository: authRepository),
    getUserSession: GetUserSessionUseCase(authRepository: authRepository),
  );
}
