import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class MyCartTotalRepo {
  Future<double?> getMyCartTotal({required String accessToken}) async {
    final res = await get(
        Uri.parse('${dotenv.env['BACKEND_BASE_URL']!}v1/api/my_cart/total/'),
        headers: {'Authorization': 'Bearer $accessToken'});
    if (res.statusCode == 200) {
      final resJson = jsonDecode(res.body);
      return resJson['total'];
    }
    return null;
  }
}
