import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

class AuthRepo {
  final storage = const FlutterSecureStorage();

  Future<String?> getAccessToken() async {
    return await storage.read(key: 'accessToken');
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
}
