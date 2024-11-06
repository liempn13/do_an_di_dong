import 'package:do_an_di_dong/models/questions_sets.dart';
import 'package:do_an_di_dong/repository/question_repo.dart';
import 'package:do_an_di_dong/repository/question_sets_repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class QuestionsSetViewModel extends ChangeNotifier {
  //lam viec voi giao dien va repo
  final QuestionSetsRepo questionSetRepository = QuestionSetsRepo();

  Future<void> getQuestionsSetsList(int topicID) async {
    try {
      await questionSetRepository.getQuestionsSetsList(topicID);
    } catch (e) {
      throw Exception("Failed Add QuestionsSets: $e");
    }
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
      await questionSetRepository
        ..addQuetionSet(QuestionsSetss);
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
