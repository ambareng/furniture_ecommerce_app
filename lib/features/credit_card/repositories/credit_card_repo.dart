import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:furniture_ecommerce_app/features/credit_card/models/credit_card.dart';
import 'package:http/http.dart';

class CreditCardRepo {
  Future<List<CreditCard>?> getAllCreditCards(
      {required String accessToken}) async {
    try {
      final res = await get(
          Uri.parse('${dotenv.env['BACKEND_BASE_URL']!}v1/api/credit_cards/'),
          headers: {'Authorization': 'Bearer $accessToken'});
      if (res.statusCode == 200) {
        final List<dynamic> listResults = jsonDecode(res.body)['results'];
        final listCreditCards = listResults.map((card) {
          return CreditCard.fromJson(card);
        }).toList();
        return listCreditCards;
      }
    } catch (err) {
      debugPrint('$err');
    }
    return null;
  }

  Future<CreditCard?> saveCreditCard(
      {required String accessToken,
      required Map<String, dynamic> creditCardPayload}) async {
    final res = await post(
        Uri.parse('${dotenv.env['BACKEND_BASE_URL']!}v1/api/credit_cards/'),
        headers: {'Authorization': 'Bearer $accessToken'},
        body: creditCardPayload);
    if (res.statusCode == 201) {
      final resJson = jsonDecode(res.body);
      return CreditCard.fromJson(resJson);
    }
    return null;
  }

  Future<List<CreditCard>?> toggleCreditCardDefault(
      {required String accessToken, required int creditCardId}) async {
    final Response res = await post(
      Uri.parse(
          '${dotenv.env['BACKEND_BASE_URL']!}v1/api/credit_cards/$creditCardId/toggle_default/'),
      headers: {'Authorization': 'Bearer $accessToken'},
    );
    if (res.statusCode == 200) {
      final List<dynamic> listResults = jsonDecode(res.body);
      return listResults.map((card) {
        return CreditCard.fromJson(card);
      }).toList();
    }
    return null;
  }
}
