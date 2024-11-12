import 'package:do_an_di_dong/models/questions.dart';
import 'package:do_an_di_dong/repository/question_set_details_repo.dart';
import 'package:flutter/material.dart';

class QuestionsSetDetailsViewModel extends ChangeNotifier {
  final QuestionSetDetailsRepo repo = QuestionSetDetailsRepo();
  List<Questions> list = []; //Danh sách tạm lưu dữ liệu gọi từ api xuống
  bool fetchingData = false; //
  List<Questions> get listQuestions => list;

  Future<void> getQuestionsSetsList(int questionSetID) async {
    fetchingData = true;
    try {
      list = await repo.loadQuestionSetDetails(questionSetID);
      notifyListeners();
    } catch (e) {
      throw Exception("Failed Load QuestionsSets: $e");
    }
    fetchingData = false;
  }
}
