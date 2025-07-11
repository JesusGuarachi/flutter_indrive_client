import 'package:indrive_client/domain/models/auth_response.dart';
import 'package:indrive_client/domain/models/user.dart';
import 'package:indrive_client/domain/utils/resource.dart';

abstract class AuthRepository {
  Future<Resource<AuthResponse>> login({
    required String email,
    required String password,
  });

  Future<Resource<AuthResponse>> register({required User user});
  Future<void> saveUserSession({required AuthResponse authResponse});
  Future<AuthResponse?> getUserSession();
  Future<bool> logout();
}
