import 'dart:convert';
import 'package:do_an_di_dong/models/questions.dart';
import 'package:do_an_di_dong/services/questions_service.dart';
import 'package:http/http.dart';

class QuestionRepo {
  //lam viec voi service
  final QuestionsService service = QuestionsService();

  Future<List<Questions>> getQuestionsList(int topicID) async {
    //lay ra danh sach cau hoi
    final reponse = await service.getQuestionsList(topicID);
    if (reponse.statusCode == 200) {
      return List<Questions>.from(
          json.decode(reponse.body).map((x) => Questions.fromJson(x)));
    } else {
      throw Exception("Failed code");
    }
  }

  Future<Questions> getQuestion(int id) async {
    //lay ra 1 cau hoi
    final response = await service.getQuestion(id);
    if (response.statusCode == 200) {
      return Questions.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed code");
    }
  }

  Future<bool> addQuetion(Questions question) async {
    final response = await service.createQuestion(question);
    if (response.statusCode == 200) {
      print("Add successful");
      return true;
    } else {
      throw Exception("Failed code");
    }
  }

  Future<bool> updateQuestion(Questions question) async {
    final response = await service.updateQuestion(question);
    if (response.statusCode == 200) {
      print("Update successful");
      return true;
    } else {
      throw Exception("Failed code");
    }
  }
}
