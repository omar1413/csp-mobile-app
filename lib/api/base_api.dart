import 'dart:io';

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
      return "تأكد من اتصالك بالانترنت ";
    } else if (e is ValidationException) {
      return e.msg;
    } else {
      return e.toString();
    }

    return "حدث خطأ  غير متوقع";
  }
}
