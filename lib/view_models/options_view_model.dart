import 'dart:ffi';

import 'package:do_an_di_dong/models/options.dart';
import 'package:do_an_di_dong/models/questions.dart';
import 'package:do_an_di_dong/repository/option_repo.dart';
import 'package:do_an_di_dong/repository/question_repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class OptionsViewModel extends ChangeNotifier {
  //lam viec voi giao dien va repo
  final OptionRepo optionRepo = OptionRepo();
  Options? options;
  List<Options> list = []; //Danh sách tạm lưu dữ liệu gọi từ api xuống
  bool fetchingData = false; //
  List<Options> get listOption =>
      list; //Lấy dữ liệu từ thg danh sách tạm sau khi ds tạm lấy DL từ api

  Future<void> getOption(int questionID) async {
    fetchingData = true;
    try {
      list = await optionRepo
          .getOptionsList(questionID); // lấy dữ liệu từ api gán vào ds tạm
      notifyListeners();
    } catch (e) {
      throw Exception("Failed Add Question: $e");
    }
    fetchingData = false;
  }

  Future<void> addOption(Options options) async {
    try {
      await optionRepo.addOption(options);
    } catch (e) {
      throw Exception("Failed Add Question: $e");
    }
  }

  Future<void> updateQuestion(Options options) async {
    try {
      await optionRepo.updateOption(options);
    } catch (e) {
      throw Exception("Failed to update Question: $e");
    }
  }
}
