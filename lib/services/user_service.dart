import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:innopay/models/user_edit_model.dart';
import 'package:innopay/services/auth_service.dart';
import 'package:innopay/shared/values.dart';

class UserService {
  Future<void> updateUser(UserEditModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.put(
        Uri.parse(
          '$baseUrl/users',
        ),
        body: data.toJson(),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
