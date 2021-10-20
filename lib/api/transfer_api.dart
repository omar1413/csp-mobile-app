import 'dart:convert';

import 'package:csp_mobile_app/api/auth_api.dart';
import 'package:csp_mobile_app/api/base_api.dart';
import 'package:csp_mobile_app/constant.dart';
import 'package:csp_mobile_app/models/recharge.dart';

import 'package:csp_mobile_app/models/subscription.dart';
import 'package:csp_mobile_app/models/transaction_data.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class TransferApi {
  static Future<Transaction> saveTransferTransaction(
      Transaction transaction) async {
    Uri url = BaseApi.getApiUrl("/eWalletTransactions/transfer");
    kHostHeader.addAll({"Authorization": AuthApi.getToken()});

    try {
      print(jsonEncode(transaction.toJson()));
      final response = await http.post(
        url,
        body: jsonEncode(transaction.toJson()),
        headers: kHostHeader,
      );
      print(response.statusCode);

      Map decodedJson = jsonDecode(utf8.decode(response.bodyBytes));
      print(decodedJson);
      if (response.statusCode == 200) {
        return Transaction.fromJson(decodedJson["data"]);
      } else {
        String msg = decodedJson["message"];
        throw Exception(" status code ${response.statusCode} >> ${msg}");
      }
    } on TypeError catch (e) {
      print(e.stackTrace);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
