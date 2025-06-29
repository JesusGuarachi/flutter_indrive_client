import 'package:indrive_client/domain/models/user.dart';

class AuthResponse {
  final User user;
  final String token;

  AuthResponse({required this.user, required this.token});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      user: User.fromJson(json['user']),
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() => {'user': user.toJson(), 'token': token};
}
