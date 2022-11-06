import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:furniture_ecommerce_app/features/home/models/furniture.dart';
import 'package:http/http.dart';

class FurnitureRepo {
  Future<List<Furniture>?> getAllFurnitures(
      {required String accessToken}) async {
    debugPrint(accessToken);
    try {
      final res = await get(
          Uri.parse('${dotenv.env['BACKEND_BASE_URL']!}v1/api/furnitures/'),
          headers: {'Authorization': 'Bearer $accessToken'});
      if (res.statusCode == 200) {
        final List<dynamic> listResults = jsonDecode(res.body)['results'];
        final listFurnitures = listResults.map((furniture) {
          return Furniture.fromJson(furniture);
        }).toList();
        return listFurnitures;
      }
    } catch (err) {
      debugPrint('$err');
    }
    return null;
  }

  Future<List<Furniture>?> getFurnituresByCategory(
      {required String category, required String accessToken}) async {
    try {
      final res = await get(
          Uri.parse(
              '${dotenv.env['BACKEND_BASE_URL']!}v1/api/furnitures/?category=${category.toLowerCase()}'),
          headers: {'Authorization': 'Bearer $accessToken'});
      if (res.statusCode == 200) {
        final List<dynamic> listResults = jsonDecode(res.body)['results'];
        debugPrint('$listResults');
        final listFurnitures = listResults.map((furniture) {
          return Furniture.fromJson(furniture);
        }).toList();
        return listFurnitures;
      }
    } catch (err) {
      debugPrint('$err');
    }
    return null;
  }
}
