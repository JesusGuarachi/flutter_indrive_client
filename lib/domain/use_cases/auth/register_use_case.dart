import 'package:indrive_client/domain/models/user.dart';
import 'package:indrive_client/domain/repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase({required this.repository});
  run(User user) => repository.register(user: user);
}
