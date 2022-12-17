import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:furniture_ecommerce_app/features/address/models/address.dart';
import 'package:http/http.dart';

class AddressRepo {
  Future<List<Address>?> getAllAddresses({required String accessToken}) async {
    try {
      final res = await get(
          Uri.parse('${dotenv.env['BACKEND_BASE_URL']!}v1/api/addresses/'),
          headers: {'Authorization': 'Bearer $accessToken'});
      if (res.statusCode == 200) {
        final List<dynamic> listResults = jsonDecode(res.body)['results'];
        final listAddresses = listResults.map((address) {
          return Address.fromJson(address);
        }).toList();
        return listAddresses;
      }
    } catch (err) {
      debugPrint('$err');
    }
    return null;
  }

  Future<Response> addAddress(
      {required String accessToken,
      required Map<String, dynamic> addAddressPayload}) async {
    final res = await post(
        Uri.parse('${dotenv.env['BACKEND_BASE_URL']!}v1/api/addresses/'),
        headers: {'Authorization': 'Bearer $accessToken'},
        body: addAddressPayload);
    return res;
  }

  Future<Response> toggleAddressDefault(
      {required String accessToken, required int addressId}) async {
    final Response res = await post(
      Uri.parse(
          '${dotenv.env['BACKEND_BASE_URL']!}v1/api/addresses/$addressId/toggle_default/'),
      headers: {'Authorization': 'Bearer $accessToken'},
    );
    return res;
  }
}
