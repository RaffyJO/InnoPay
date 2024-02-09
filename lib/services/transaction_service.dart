import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:innopay/models/topup_model.dart';
import 'package:innopay/services/auth_service.dart';
import 'package:innopay/shared/values.dart';

class TransactionService {
  Future<String> topUp(TopupModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse(
          '$baseUrl/top_ups',
        ),
        body: data.toJson(),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['redirect_url'];
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
