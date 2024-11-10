import 'dart:convert';

import 'package:do_an_di_dong/models/questions.dart';
import 'package:do_an_di_dong/services/questions_sets_detail_service.dart';

class QuestionSetDetailsRepo {
  final QuestionsSetsDetailService service = QuestionsSetsDetailService();

  Future<List<Questions>> loadQuestionSetDetails(int questionsSetID) async {
    final response = await service.getQuestionSetDetails(questionsSetID);
    if (response.statusCode == 200) {
      return List<Questions>.from(
          json.decode(response.body).map((x) => Questions.fromJson(x)));
     
    } else {
      throw Exception("Failed code");
    }
  }
}
