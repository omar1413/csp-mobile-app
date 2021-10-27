import 'dart:io';

import 'package:csp_mobile_app/translations/translations_bundle.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:csp_mobile_app/exception/validation_exception.dart';

import '../constant.dart';

class BaseApi {
  static getApiUrl(String path) {
    Uri url = Uri.http(kHost, "${kPrefixHost}$path");
    print("url : " + url.toString());
    return url;
  }

  static String handleError(Object e) {
    if (e is SocketException) {
      return translate("SOCKET_ERROR");
    } else {
      return translate(e.toString());
    }
  }
}
