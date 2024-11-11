import 'dart:convert';

import 'package:do_an_di_dong/models/options.dart';
import 'package:do_an_di_dong/services/options_service.dart';

class OptionRepo {
  final OptionsService service = OptionsService();

  Future<List<Options>> getOptionsOfQuestion(int questionID) async {
    //lay ra danh sach cau hoi
    final reponse = await service.getOptionsOfQuestion(questionID);
    if (reponse.statusCode == 200) {
      return List<Options>.from(
          json.decode(reponse.body).map((x) => Options.fromJson(x)));
    } else {
      throw Exception("Failed code: ${reponse.statusCode}");
    }
  }

  Future<bool> addOption(Options option) async {
    final response = await service.createOption(option);
    if (response.statusCode == 200) {
      print("Add answer successful");
      return true;
    } else {
      throw Exception("Failed code");
    }
  }

  Future<bool> updateOption(Options option) async {
    final response = await service.updateOption(option);
    if (response.statusCode == 200) {
      print("Update anwser successful");
      return true;
    } else {
      throw Exception("Failed code");
    }
  }
}
