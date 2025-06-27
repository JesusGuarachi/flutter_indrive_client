import 'package:indrive_client/domain/models/auth_response.dart';
import 'package:indrive_client/domain/repository/auth_repository.dart';

class SaveUserSessionUseCase {
  final AuthRepository authRepository;

  SaveUserSessionUseCase({required this.authRepository});
  run(AuthResponse authResponse) =>
      authRepository.saveUserSession(authResponse: authResponse);
}
