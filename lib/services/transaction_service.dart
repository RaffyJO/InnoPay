import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:innopay/models/data_internet_plan_model.dart';
import 'package:innopay/models/operator_card_model.dart';
import 'package:innopay/models/topup_model.dart';
import 'package:innopay/models/transfer_model.dart';
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

  Future<void> transfer(TransferModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse(
          '$baseUrl/transfers',
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

  Future<List<OperatorCardModel>> getOperatorCards() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse(
          '$baseUrl/operator_cards',
        ),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return List<OperatorCardModel>.from(
          jsonDecode(res.body)['data'].map(
            (operatorCard) => OperatorCardModel.fromJson(operatorCard),
          ),
        ).toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> buyDataInternet(DataInternetPlanModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse(
          '$baseUrl/data_plans',
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
