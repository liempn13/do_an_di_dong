import 'dart:convert';
import 'package:do_an_di_dong/constant/app_strings.dart';
import 'package:do_an_di_dong/models/questions.dart';
import 'package:http/http.dart' as http;

//lam viec truc tiep voi api
class QuestionsService {
  Future<http.Response> createQuestion(Questions question) async {
    //Them
    return await http.post(Uri.parse("${AppStrings.baseUrlApi}question"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(question.toJson()));
  }

  Future<http.Response> updateQuestion(Questions question) async {
    //Sua
    return await http.put(
        Uri.parse("${AppStrings.baseUrlApi}question/$question"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(question.toJson()));
  }

  Future<http.Response> getQuestion(int questionsetID) async {
    //Load
    return await http.get(
      Uri.parse("${AppStrings.baseUrlApi}question/$questionsetID"),
    );
  }

  Future<http.Response> getQuestionsList(int topicID) async {
    //Load
    return await http.get(
      Uri.parse("${AppStrings.baseUrlApi}question/$topicID"),
    );
  }
}
