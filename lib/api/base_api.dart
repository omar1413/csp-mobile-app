import 'dart:io';

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
    } else {
      return e.toString();
    }

    return "حدث خطأ  غير متوقع";
  }
}
