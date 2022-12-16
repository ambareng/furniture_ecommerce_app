import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

class AuthRepo {
  final storage = const FlutterSecureStorage();

  Future<bool> _checkIfAccessTokenValid({required String accessToken}) async {
    final Response res = await post(
        Uri.parse(
            '${dotenv.env['BACKEND_BASE_URL']!}v1/api/auth/token/verify/'),
        body: {"token": accessToken});
    if (res.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<String?> _refreshToken({required String refreshToken}) async {
    final Response res = await post(
        Uri.parse(
            '${dotenv.env['BACKEND_BASE_URL']!}v1/api/auth/token/refresh/'),
        body: {"refresh": refreshToken});
    if (res.statusCode == 200) {
      final Map<String, dynamic> resJson = jsonDecode(res.body);
      return resJson['access'];
    }
    return null;
  }

  Future<String?> getAccessToken() async {
    final String? accessToken = await storage.read(key: 'accessToken');
    if (accessToken != null) {
      if (await _checkIfAccessTokenValid(accessToken: accessToken)) {
        return accessToken;
      }
      final String? refreshToken = await getRefreshToken();
      if (refreshToken != null) {
        final String? newAccessToken =
            await _refreshToken(refreshToken: refreshToken);
        if (newAccessToken != null) {
          await storage.write(key: 'accessToken', value: newAccessToken);
          return newAccessToken;
        }
      }
    }
    return null;
  }

  Future<String?> getRefreshToken() async {
    return await storage.read(key: 'refreshToken');
  }

  Future<void> saveTokens(
      {required String accessToken, required String refreshToken}) async {
    await storage.write(key: 'accessToken', value: accessToken);
    await storage.write(key: 'refreshToken', value: refreshToken);
  }

  Future<Map<String, dynamic>> login(
      {required email, required password}) async {
    try {
      final payload = {'email': email, 'password': password};
      final res = await post(
          Uri.parse('${dotenv.env['BACKEND_BASE_URL']!}v1/api/auth/token/'),
          body: payload);
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      }
      return jsonDecode(res.body);
    } catch (err) {
      return {};
    }
  }

  Future<Response> register(
      {required String email,
      required String password,
      required String confirmPassword,
      required String firstName,
      required String lastName}) async {
    final payload = {
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'password': password,
      'confirm_password': confirmPassword
    };
    final res = await post(
        Uri.parse('${dotenv.env['BACKEND_BASE_URL']!}v1/api/auth/register/'),
        body: payload);
    return res;
  }
}
