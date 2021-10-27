import 'dart:convert';

import 'package:csp_mobile_app/api/auth_api.dart';
import 'package:csp_mobile_app/api/base_api.dart';
import 'package:csp_mobile_app/constant.dart';
import 'package:csp_mobile_app/exception/general_exception.dart';
import 'package:csp_mobile_app/models/account.dart';
import 'package:csp_mobile_app/models/recharge.dart';

import 'package:csp_mobile_app/models/subscription.dart';
import 'package:csp_mobile_app/models/transaction_data.dart';
import 'package:csp_mobile_app/widets/messages.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class TransferApi {
  static Future<bool> saveTransferTransaction(Transaction transaction) async {
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
        return decodedJson["success"];
      } else {
        String msg = decodedJson["message"];
        throw GeneralException(decodedJson["message"]);
        // throw Exception(" status code ${response.statusCode} >> ${msg}");
      }
    } on TypeError catch (e) {
      print(e.stackTrace);
      rethrow;
    } catch (e) {
      print(e.runtimeType);
      rethrow;
    }
  }

  static Future<Account> gitAccountByAccNumber(
      int number, int year, int type) async {
    Uri url = BaseApi.getApiUrl(
        "/account/findByAccountNumber/${number}/${year}/${type}");
    kHostHeader.addAll({"Authorization": AuthApi.getToken()});

    try {
      final account = await http.get(
        url,
        headers: kHostHeader,
      );

      print(account.statusCode);
      Account acc;
      Map jsonData = jsonDecode(utf8.decode(account.bodyBytes));
      if (account.statusCode == 200) {
        print(jsonData["data"]);
        acc = Account.fromJson(jsonData["data"]);

        return acc;
      }
      throw GeneralException(jsonData["message"]);
      //throw GeneralException(jsonData["message"]);
    } on TypeError catch (e) {
      print(e.stackTrace);
    } catch (e) {
      print("transactio_api" + e.toString());
      print(e.runtimeType);
      rethrow;
    }
    throw Exception();
  }
}
