import 'package:indrive_client/data/data_source/local/shared_pref.dart';
import 'package:indrive_client/data/data_source/remote/services/auth_service.dart';
import 'package:indrive_client/domain/models/auth_response.dart';
import 'package:indrive_client/domain/models/user.dart';
import 'package:indrive_client/domain/repository/auth_repository.dart';
import 'package:indrive_client/domain/utils/resource.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthService authService;
  final SharedPref sharedPref;

  AuthRepositoryImpl({required this.authService, required this.sharedPref});
  @override
  Future<Resource<AuthResponse>> login({
    required String email,
    required String password,
  }) {
    return authService.login(email, password);
  }

  @override
  Future<Resource<AuthResponse>> register({required User user}) {
    return authService.register(user);
  }

  @override
  Future<AuthResponse?> getUserSession() async {
    final data = await sharedPref.read(key: 'user');
    return data != null ? AuthResponse.fromJson(data) : null;
  }

  @override
  Future<void> saveUserSession({required AuthResponse authResponse}) async {
    await sharedPref.save(key: 'user', value: authResponse.toJson());
  }
}
