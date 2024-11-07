import 'dart:convert';

import 'package:do_an_di_dong/models/options.dart';
import 'package:do_an_di_dong/models/questions.dart';
import 'package:do_an_di_dong/services/questions_sets_detail_service.dart';

class QuestionSetDetailsRepo {
  final QuestionsSetsDetailService service = QuestionsSetsDetailService();

  List<Options> optionsList = [];
  List<Questions> questionList = [];

  Future<void> loadQuestionSetDetails(int questionsSetID) async {
    final response = await service.getQuestionSetDetails(questionsSetID);
    if (response.statusCode == 200) {
      optionsList = List<Options>.from(
          json.decode(response.body).map((x) => Options.fromJson(x)));
      questionList = List<Questions>.from(
          json.decode(response.body).map((x) => Questions.fromJson(x)));
    } else {
      throw Exception("Failed code");
    }
  }
}
