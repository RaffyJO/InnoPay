import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:innopay/shared/values.dart';

class AuthService {
  Future<bool> checkEmail(String email) async {
    try {
      final res = await http.post(
          Uri.parse(
            '$baseUrl/is-email-exist',
          ),
          body: {
            'email': email,
          });

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['is_email_exist'];
      } else {
        return jsonDecode(res.body)['errors'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
