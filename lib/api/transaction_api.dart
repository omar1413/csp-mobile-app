import 'package:csp_mobile_app/api/auth_api.dart';
import 'package:csp_mobile_app/api/base_api.dart';
import 'package:csp_mobile_app/exception/general_exception.dart';

import 'package:csp_mobile_app/models/transaction_data.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constant.dart';

Future<List<Transaction>> getAllTransaction(
    {required int pageNo, required int pageSize}) async {
  Uri url = BaseApi.getApiUrl("/eWalletTransactions/${pageNo}/${pageSize}");

  kHostHeader.addAll({"Authorization": AuthApi.getToken()});
  try {
    final TransactionData = await http.get(
      url,
      headers: kHostHeader,
    );

    Map jsonData = jsonDecode(utf8.decode(TransactionData.bodyBytes));
    if (TransactionData.statusCode == 200) {
      print(jsonData["data"]);
      List<Transaction> allTransaction = [];
      for (var transaction in jsonData["data"]["result"]) {
        print(transaction);

        allTransaction.add(Transaction.fromJson(transaction));
      }
      print(allTransaction[0].amount);
      return allTransaction;
    }

    throw GeneralException(jsonData["message"]);
  } on TypeError catch (e) {
    print(e.stackTrace);
  } catch (e) {
    print("transactio_api" + e.toString());
    print(e.runtimeType);
    rethrow;
  }
  throw Exception();
}
