import 'package:do_an_di_dong/models/options.dart';
import 'package:do_an_di_dong/models/player_history.dart';
import 'package:do_an_di_dong/repository/option_repo.dart';
import 'package:do_an_di_dong/repository/played_history.dart';
import 'package:flutter/material.dart';

class PlayedHistoryViewModels extends ChangeNotifier {
  //lam viec voi giao dien va repo
  final PlayedHistoryRepository historyRepository = PlayedHistoryRepository();

  Future<void> add(History options) async {
    try {
      await historyRepository.addhistory(options);
    } catch (e) {
      throw Exception("Failed Add Option: $e");
    }
  }

  Future<void> update(History options) async {
    try {
      await historyRepository.updatehistory(options);
    } catch (e) {
      throw Exception("Failed to update Option: $e");
    }
  }
}
