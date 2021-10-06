import '../constant.dart';

class BaseApi {
  static getApiUrl(String path) {
    Uri url = Uri.http(kHost, "${kPrefixHost}$path");
    print("url : " + url.toString());
    return url;
  }
}
