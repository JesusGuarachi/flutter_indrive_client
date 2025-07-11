import 'package:indrive_client/domain/repository/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository authRepository;

  LogoutUseCase({required this.authRepository});
  run() => authRepository.logout();
}
