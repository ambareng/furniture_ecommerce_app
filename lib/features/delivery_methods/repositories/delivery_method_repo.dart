import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:furniture_ecommerce_app/features/delivery_methods/models/delivery_method.dart';
import 'package:http/http.dart';

class DeliveryMethodRepo {
  Future<List<DeliveryMethod>?> getAllDeliveryMethods(
      {required String accessToken}) async {
    final res = await get(
        Uri.parse('${dotenv.env['BACKEND_BASE_URL']!}v1/api/delivery_methods/'),
        headers: {'Authorization': 'Bearer $accessToken'});
    if (res.statusCode == 200) {
      final List<dynamic> listResults = jsonDecode(res.body)['results'];
      final listDeliveryMethods = listResults.map((deliveryMethod) {
        return DeliveryMethod.fromJson(deliveryMethod);
      }).toList();
      return listDeliveryMethods;
    }
    return null;
  }
}
