import 'dart:convert';
import 'package:do_an_di_dong/models/questions_sets.dart';
import 'package:do_an_di_dong/services/questions_sets_service.dart';
import 'package:http/http.dart';

class QuestionSetsRepo {
  //lam viec voi service
  final QuestionsSetsService service = QuestionsSetsService();

  Future<List<QuestionsSets>> getQuestionsSetsList(int topicID) async {
    //lay ra danh sach cau hoi
    final reponse = await service.getQuestionsSetsList(topicID);
    if (reponse.statusCode == 200) {
      return List<QuestionsSets>.from(
          json.decode(reponse.body).map((x) => QuestionsSets.fromJson(x)));
    } else {
      throw Exception("Failed code");
    }
  }

  Future<QuestionsSets> getQuestionSet(int id) async {
    //lay ra 1 cau hoi
    final response = await service.getQuestionSets(id);
    if (response.statusCode == 200) {
      return QuestionsSets.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed code");
    }
  }

  Future<bool> addQuetionSet(QuestionsSets question) async {
    final response = await service.createQuestionSets(question);
    if (response.statusCode == 200) {
      print("Add successful");
      return true;
    } else {
      throw Exception("Failed code");
    }
  }

  Future<bool> updateQuestionSet(QuestionsSets question) async {
    final response = await service.updateQuestionSets(question);
    if (response.statusCode == 200) {
      print("Update successful");
      return true;
    } else {
      throw Exception("Failed code");
    }
  }
}
