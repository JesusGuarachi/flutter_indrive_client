import 'package:indrive_client/domain/use_cases/auth/get_user_session_use_case.dart';
import 'package:indrive_client/domain/use_cases/auth/login_use_case.dart';
import 'package:indrive_client/domain/use_cases/auth/logout_use_case.dart';
import 'package:indrive_client/domain/use_cases/auth/register_use_case.dart';
import 'package:indrive_client/domain/use_cases/auth/save_user_session_use_case.dart';

class AuthUseCases {
  final LoginUseCase login;
  final RegisterUseCase register;
  final SaveUserSessionUseCase saveUserSession;
  final GetUserSessionUseCase getUserSession;
  final LogoutUseCase logout;

  AuthUseCases({
    required this.login,
    required this.register,
    required this.saveUserSession,
    required this.getUserSession,
    required this.logout,
  });
}
