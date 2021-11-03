import 'dart:convert';

import 'package:csp_mobile_app/api/auth_api.dart';
import 'package:csp_mobile_app/api/base_api.dart';
import 'package:csp_mobile_app/exception/general_exception.dart';
import 'package:csp_mobile_app/models/account.dart';
import 'package:csp_mobile_app/models/account_type_lkp.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';

class AccountApi {
  static Future<List<AccountType>> accountTypesLkp() async {
    Uri url = BaseApi.getApiUrl("/account/accountTypeLkp");
    kHostHeader.addAll({"Authorization": AuthApi.getToken()});
    try {
      final response = await http.get(
        url,
        headers: kHostHeader,
      );
      Map decodedJson = jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        List<AccountType> accountTypes = [];

        for (Map m in decodedJson["data"]) {
          accountTypes.add(AccountType.fromJson(m));
        }

        return accountTypes;
      } else {
        throw GeneralException(decodedJson["message"]);
        // throw Exception("bundleLkp status code ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future<Account> accountData() async {
    Uri url = BaseApi.getApiUrl("/account");
    kHostHeader.addAll({"Authorization": AuthApi.getToken()});
    try {
      final response = await http.get(
        url,
        headers: kHostHeader,
      );
      Map decodedJson = jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        Account account = Account.fromJson(decodedJson);

        return account;
      } else {
        throw GeneralException(decodedJson["message"]);
        // throw Exception("bundleLkp status code ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
