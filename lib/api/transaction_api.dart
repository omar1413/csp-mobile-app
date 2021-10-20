import 'package:csp_mobile_app/api/auth_api.dart';
import 'package:csp_mobile_app/api/base_api.dart';

import 'package:csp_mobile_app/models/transaction_data.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constant.dart';

Future<List<Transaction>> getAllTransaction({
  int pageNo = 0,
  int pageSize = 10,
}) async {
  Uri url = BaseApi.getApiUrl("/eWalletTransactions/${pageNo}/${pageSize}");
  print(url);
  kHostHeader.addAll({"Authorization": AuthApi.getToken()});
  try {
    final TransactionData = await http.get(
      url,
      headers: kHostHeader,
    );
    print("jjjjjjjjjjjjjjjjjjjjj");
    print(TransactionData.statusCode);
    if (TransactionData.statusCode == 200) {
      Map jsonData = jsonDecode(utf8.decode(TransactionData.bodyBytes));
      print(jsonData["data"]);
      List<Transaction> allTransaction = [];
      for (var transaction in jsonData["data"]) {
        print(transaction);

        allTransaction.add(Transaction.fromJson(transaction));

        print("Fffffffffffffffffffddddddff");
      }
      print(allTransaction[0].amount);
      return allTransaction;
    }
  } on TypeError catch (e) {
    print(e.stackTrace);
  } catch (e) {
    print("transactio_api" + e.toString());
    print(e.runtimeType);
    rethrow;
  }
  throw Exception();
}
