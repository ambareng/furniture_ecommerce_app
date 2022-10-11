import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:furniture_ecommerce_app/features/home/models/furniture.dart';
import 'package:http/http.dart';

class FurnitureRepo {
  Future<List<Furniture?>> getAllFurnitures() async {
    try {
      final res = await get(
        Uri.parse('${dotenv.env['BACKEND_BASE_URL']!}v1/api/furnitures/'),
      );
      if (res.statusCode == 200) {
        final List<dynamic> listResults = jsonDecode(res.body)['results'];
        final listFurnitures = listResults.map((furniture) {
          return Furniture.fromJson(furniture);
        });
        debugPrint('$listFurnitures');
      }
    } catch (err) {
      debugPrint('$err');
    }
    return [];
  }
}
