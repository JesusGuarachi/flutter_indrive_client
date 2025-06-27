import 'package:indrive_client/data/repository/auth_repository_impl.dart';
import 'package:indrive_client/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase({required this.repository});
  run({required String email, required String password}) =>
      repository.login(email: email, password: password);
}
