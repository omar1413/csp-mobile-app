// ignore_for_file: file_names

import 'package:csp_mobile_app/api/auth_api.dart';
import 'package:csp_mobile_app/api/base_api.dart';
import 'package:csp_mobile_app/models/chat_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constant.dart';

Future<List<ChatModel>> getchatbot() async {
  Uri url = BaseApi.getApiUrl("/chatBot");

  kHostHeader.addAll({"Authorization": AuthApi.getToken()});
  try {
    final chatbotData = await http.get(
      url,
      headers: kHostHeader,
    );
    print(chatbotData.statusCode);
    if (chatbotData.statusCode == 200) {
      Map jsonData = jsonDecode(utf8.decode(chatbotData.bodyBytes));
      print(jsonData["data"]);
      List<ChatModel> listquestion = [];
      for (var question in jsonData["data"]) {
        listquestion.add(ChatModel.fromJson(question));
      }
      print(listquestion);
      return listquestion;
    }
  } catch (e) {
    print(e);
    rethrow;
  }
  throw Exception();
}
