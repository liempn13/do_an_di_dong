import 'package:do_an_di_dong/models/questions.dart';
import 'package:do_an_di_dong/repository/question_repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class QuestionsViewModel extends ChangeNotifier {
  //lam viec voi giao dien va repo
  final QuestionRepo questionRepo = QuestionRepo();
  Questions? questions;

  Future<void> getQuestion(int questionID) async {
    try {
      await questionRepo.getQuestion(questionID);
    } catch (e) {
      throw Exception("Failed Add Question: $e");
    }
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
