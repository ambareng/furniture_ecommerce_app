import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:furniture_ecommerce_app/features/promo/models/promo.dart';
import 'package:http/http.dart';

class PromoRepo {
  Future<Promo?> getCurrentPromo({required String accessToken}) async {
    final res = await get(
        Uri.parse('${dotenv.env['BACKEND_BASE_URL']!}v1/api/promos/current/'),
        headers: {'Authorization': 'Bearer $accessToken'});
    if (res.statusCode == 200) {
      final resJson = jsonDecode(res.body);
      return Promo.fromJson(resJson);
    }
    return null;
  }

  Future<bool> removeCurrentPromo(
      {required String accessToken, required String promoName}) async {
    final res = await post(
        Uri.parse(
            '${dotenv.env['BACKEND_BASE_URL']!}v1/api/promos/$promoName/remove/'),
        headers: {'Authorization': 'Bearer $accessToken'});
    if (res.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<Promo?> applyPromo(
      {required String accessToken, required String promoName}) async {
    final res = await post(
        Uri.parse(
            '${dotenv.env['BACKEND_BASE_URL']!}v1/api/promos/$promoName/apply/'),
        headers: {'Authorization': 'Bearer $accessToken'});
    if (res.statusCode == 200) {
      final resJson = jsonDecode(res.body);
      return Promo.fromJson(resJson);
    }
    return null;
  }
}
