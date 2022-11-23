import 'dart:convert';

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

  Future<Furniture?> toggleBookmark(
      {required String accessToken, required int furnitureId}) async {
    try {
      final res = await post(
          Uri.parse(
              '${dotenv.env['BACKEND_BASE_URL']!}v1/api/furnitures/$furnitureId/toggle_bookmark/'),
          headers: {'Authorization': 'Bearer $accessToken'});
      if (res.statusCode == 200) {
        final resJson = jsonDecode(res.body);
        return Furniture.fromJson(resJson);
      }
    } catch (err) {
      debugPrint('$err');
    }
    return null;
  }

  Future<List<Furniture>?> getBookmarkedFurnitures(
      {required String accessToken}) async {
    try {
      final res = await get(
          Uri.parse(
              '${dotenv.env['BACKEND_BASE_URL']!}v1/api/furnitures/bookmarked/'),
          headers: {'Authorization': 'Bearer $accessToken'});
      if (res.statusCode == 200) {
        final List<dynamic> listResults = jsonDecode(res.body)['results'];
        final bookmarkedFurnitures = listResults.map((furniture) {
          return Furniture.fromJson(furniture);
        }).toList();
        return bookmarkedFurnitures;
      }
    } catch (err) {
      debugPrint('$err');
    }
    return null;
  }

  Future<Furniture?> getFurniture(
      {required String accessToken, required int furnitureId}) async {
    final res = await get(
        Uri.parse(
            '${dotenv.env['BACKEND_BASE_URL']!}v1/api/furnitures/$furnitureId/'),
        headers: {'Authorization': 'Bearer $accessToken'});
    if (res.statusCode == 200) {
      final resJson = jsonDecode(res.body);
      return Furniture.fromJson(resJson);
    }
    return null;
  }

  Future<Response> addToCart(
      {required String accessToken,
      required int furnitureId,
      required int quantity}) async {
    final payload = jsonEncode({'quantity': quantity});
    final res = await post(
        Uri.parse(
            '${dotenv.env["BACKEND_BASE_URL"]}v1/api/furnitures/$furnitureId/add_to_cart/'),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json'
        },
        body: payload);
    debugPrint(res.body);
    return res;
  }
}
