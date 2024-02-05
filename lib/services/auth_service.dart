import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:innopay/models/register_model.dart';
import 'package:innopay/models/user_model.dart';
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
        throw jsonDecode(res.body)['errors']['email'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> register(RegisterModel data) async {
    try {
      print('12');
      final res = await http.post(
        Uri.parse(
          '$baseUrl/register',
        ),
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body));
        user = user.copyWith(password: data.password);

        return user;
      } else {
        print('sdsdsd');
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      print('wwww');
      rethrow;
    }
  }
}
