import 'package:do_an_di_dong/models/questions_sets.dart';
import 'package:do_an_di_dong/repository/question_sets_repo.dart';
import 'package:flutter/material.dart';

class QuestionsSetViewModel extends ChangeNotifier {
  //lam viec voi giao dien va repo
  final QuestionSetsRepo questionSetRepository = QuestionSetsRepo();
  QuestionsSets? questionsSets;
  List<QuestionsSets> list = []; //Danh sách tạm lưu dữ liệu gọi từ api xuống
  bool fetchingData = false; //
  List<QuestionsSets> get listQuestionSets => list;

  Future<void> getQuestionsSetsList(int topicID) async {
    fetchingData = true;
    try {
      list = await questionSetRepository.getQuestionsSetsList(topicID);
      notifyListeners();
    } catch (e) {
      throw Exception("Failed Add QuestionsSets: $e");
    }
    fetchingData = false;
  }

  Future<void> getQuestionsSets(int QuestionsSetsID) async {
    try {
      await questionSetRepository.getQuestionSet(QuestionsSetsID);
    } catch (e) {
      throw Exception("Failed Add QuestionsSets: $e");
    }
  }

  Future<void> addQuestionsSets(QuestionsSets QuestionsSetss) async {
    try {
      questionSetRepository.addQuetionSet(QuestionsSetss);
    } catch (e) {
      throw Exception("Failed Add QuestionsSets: $e");
    }
  }

  Future<void> updateQuestionsSets(QuestionsSets QuestionsSetss) async {
    try {
      await questionSetRepository.updateQuestionSet(QuestionsSetss);
    } catch (e) {
      throw Exception("Failed to update QuestionsSets: $e");
    }
  }
}
