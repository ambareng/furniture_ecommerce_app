import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

class AuthRepo {
  static const storage = FlutterSecureStorage();

  Future<String?> getAccessToken() async {
    return await storage.read(key: 'accessToken');
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
