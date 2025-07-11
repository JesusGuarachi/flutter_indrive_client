import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:indrive_client/data/api/api_config.dart';
import 'package:indrive_client/domain/models/auth_response.dart';
import 'package:indrive_client/domain/models/user.dart';
import 'package:indrive_client/domain/utils/resource.dart';
import 'package:indrive_client/presentation/page/auth/utils/list_to_string.dart';

class AuthService {
  Future<Resource<AuthResponse>> login(String email, String password) async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROJECT, '/auth/login');
      Map<String, String> headers = {'Content-Type': 'application/json'};
      String body = jsonEncode({'email': email, 'password': password});
      final response = await http.post(url, headers: headers, body: body);
      final data = jsonDecode(response.body);
      if (response.statusCode == HttpStatus.accepted ||
          response.statusCode == HttpStatus.created) {
        print(data);
        AuthResponse authResponse = AuthResponse.fromJson(data);

        return Success(authResponse);
      }
      return ErrorData(message: listToString(data['message']));
    } catch (e) {
      return ErrorData(message: e.toString());
    }
  }

  Future<Resource<AuthResponse>> register(User user) async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROJECT, '/auth/register');
      Map<String, String> headers = {'Content-Type': 'application/json'};
      String body = jsonEncode(user);
      final response = await http.post(url, headers: headers, body: body);
      final data = jsonDecode(response.body);
      if (response.statusCode == HttpStatus.accepted ||
          response.statusCode == HttpStatus.created) {
        AuthResponse authResponse = AuthResponse.fromJson(data);

        return Success(authResponse);
      }
      return ErrorData(message: listToString(data['message']));
    } catch (e) {
      return ErrorData(message: e.toString());
    }
  }
}
