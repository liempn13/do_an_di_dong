import 'package:do_an_di_dong/constant/app_strings.dart';
import 'package:http/http.dart' as http;

class QuestionsSetsDetailService {
  Future<http.Response> getQuestionSetDetails(int questionsSetID) async {
    //Load
    return await http.get(
      Uri.parse("${AppStrings.baseUrlApi}set/details/$questionsSetID"),
    );
  }
}
