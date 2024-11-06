import 'package:do_an_di_dong/models/topics.dart';
import 'package:do_an_di_dong/repository/topic_repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TopicsViewModel extends ChangeNotifier {
  //lam viec voi giao dien va repo
  final TopicRepo topicRepo = TopicRepo();

  List<Topics> list = []; //Danh sách tạm lưu dữ liệu gọi từ api xuống
  bool fetchingData = false; //
  List<Topics> get listTopics => list;

  Future<void> getTopicsList() async {
    fetchingData = true;
    try {
      list = await topicRepo.getTopicsList();
      notifyListeners();
    } catch (e) {
      throw Exception("Failed Load topic: $e");
    }
    fetchingData = false;
  }

  Future<void> addTopic(Topics topics) async {
    try {
      await topicRepo.addTopics(topics);
    } catch (e) {
      throw Exception("Failed Add topic: $e");
    }
  }

  Future<void> updateTopics(Topics topics) async {
    try {
      await topicRepo.updateTopics(topics);
    } catch (e) {
      throw Exception("Failed to update topic: $e");
    }
  }
}
