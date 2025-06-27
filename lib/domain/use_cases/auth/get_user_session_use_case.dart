import 'package:indrive_client/domain/repository/auth_repository.dart';

class GetUserSessionUseCase {
  final AuthRepository authRepository;

  GetUserSessionUseCase({required this.authRepository});
  run() => authRepository.getUserSession();
}
