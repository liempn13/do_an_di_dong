import 'dart:convert';
import 'package:do_an_di_dong/constant/app_strings.dart';
import 'package:do_an_di_dong/models/player_history.dart';
import 'package:http/http.dart' as http;

class HistorysService {
  Future<http.Response> createHistory(History history) async {
    //Them
    return await http.post(Uri.parse("${AppStrings.baseUrlApi}"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(history.toJson()));
  }

  Future<http.Response> updateHistory(History history) async {
    //Sua
    return await http.put(Uri.parse("${AppStrings.baseUrlApi}"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(history.toJson()));
  }

  Future<http.Response> getHistorysOfQuestion(int questionID) async {
    //Load
    return await http.get(
        Uri.parse("${AppStrings.baseUrlApi}Historys/question/$questionID"),
        headers: {'Authorization': 'Bearer ${AppStrings.TOKEN}'});
  }
}
