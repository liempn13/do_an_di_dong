import 'dart:convert';
import 'package:do_an_di_dong/models/options.dart';
import 'package:do_an_di_dong/constant/app_strings.dart';
import 'package:http/http.dart' as http;

class OptionsService {
  Future<http.Response> createOption(Options option) async {
    //Them
    return await http.post(Uri.parse("${AppStrings.baseUrlApi}"),
        headers: {
          'Authorization': 'Bearer ${AppStrings.TOKEN}',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(option.toJson()));
  }

  Future<http.Response> updateOption(Options option) async {
    //Sua
    return await http.put(Uri.parse("${AppStrings.baseUrlApi}"),
        headers: {
          'Authorization': 'Bearer ${AppStrings.TOKEN}',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(option.toJson()));
  }

  Future<http.Response> getOptionsOfQuestion(int questionID) async {
    //Load
    return await http.get(
        Uri.parse("${AppStrings.baseUrlApi}options/question/$questionID"),
        headers: {'Authorization': 'Bearer ${AppStrings.TOKEN}'});
  }
}
