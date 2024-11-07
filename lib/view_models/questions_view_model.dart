import 'package:do_an_di_dong/models/questions.dart';
import 'package:do_an_di_dong/repository/question_repo.dart';
import 'package:flutter/material.dart';

class QuestionsViewModel extends ChangeNotifier {
  //lam viec voi giao dien va repo
  final QuestionRepo questionRepo = QuestionRepo();
  Questions? questions;
  List<Questions> list = []; //Danh sách tạm lưu dữ liệu gọi từ api xuống
  bool fetchingData = false; //
  List<Questions> get listQuestion => list;

  Future<void> getQuestionList(int questionID) async {
    fetchingData = true;
    try {
      list = await questionRepo.getQuestionsList(questionID);
      notifyListeners();
    } catch (e) {
      throw Exception("Failed Add Question: $e");
    }
    fetchingData = false;
  }

  Future<void> addQuestion(Questions questions) async {
    try {
      await questionRepo.addQuetion(questions);
    } catch (e) {
      throw Exception("Failed Add Question: $e");
    }
  }

  Future<void> updateQuestion(Questions questions) async {
    try {
      await questionRepo.updateQuestion(questions);
    } catch (e) {
      throw Exception("Failed to update Question: $e");
    }
  }
}
