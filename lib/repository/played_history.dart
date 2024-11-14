import 'dart:convert';
import 'package:do_an_di_dong/models/player_history.dart';
import 'package:do_an_di_dong/services/played_historty_services.dart';

class PlayedHistoryRepository {
  final HistorysService service = HistorysService();

  Future<bool> addhistory(History history) async {
    final response = await service.createHistory(history);
    if (response.statusCode == 200) {
      print("Add successful");
      return true;
    } else {
      throw Exception("Failed code");
    }
  }

  Future<bool> updatehistory(History history) async {
    final response = await service.updateHistory(history);
    if (response.statusCode == 200) {
      print("Update successful");
      return true;
    } else {
      throw Exception("Failed code");
    }
  }
}
