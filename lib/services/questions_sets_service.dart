import 'dart:convert';

import 'package:do_an_di_dong/constant/app_strings.dart';
import 'package:do_an_di_dong/models/questions_sets.dart';
import 'package:http/http.dart' as http;

class QuestionsSetsService {
  Future<http.Response> createQuestionSets(QuestionsSets question) async {
    //Them
    return await http.post(Uri.parse("${AppStrings.baseUrlApi}question"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(question.toJson()));
  }

  Future<http.Response> updateQuestionSets(QuestionsSets question) async {
    //Sua
    return await http.put(Uri.parse("${AppStrings.baseUrlApi}question"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(question.toJson()));
  }

  Future<http.Response> getQuestionSets(int questionsSetID) async {
    //Load
    return await http.get(
      Uri.parse("${AppStrings.baseUrlApi}question/$questionsSetID"),
    );
  }

  Future<http.Response> getQuestionsSetsList(int topicID) async {
    //Load
    return await http.get(
      Uri.parse("${AppStrings.baseUrlApi}question/$topicID"),
    );
  }
}
