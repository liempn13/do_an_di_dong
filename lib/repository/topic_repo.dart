import 'dart:convert';

import 'package:do_an_di_dong/models/topics.dart';
import 'package:do_an_di_dong/services/topics_service.dart';

class TopicRepo {
  //lam viec voi service
  final TopicsService service = TopicsService();

  Future<bool> addTopics(Topics topic) async {
    final reponse = await service.createTopics(topic);
    if (reponse.statusCode == 200) {
      return true;
    } else {
      throw Exception("Failed code");
    }
  }

  Future<bool> updateTopics(Topics topic) async {
    final response = await service.updateTopics(topic);
    if (response.statusCode == 200) {
      print("Add successful");
      return true;
    } else {
      throw Exception("Failed code");
    }
  }

  Future<List<Topics>> getTopicsList() async {
    final reponse = await service.getTopicsList();
    if (reponse.statusCode == 200) {
      return List<Topics>.from(
          json.decode(reponse.body).map((x) => Topics.fromJson(x)));
    } else {
      throw Exception("Failed code");
    }
  }

  Future<Topics> getTopic(int topicID) async {
    final reponse = await service.getTopic(topicID);
    if (reponse.statusCode == 200) {
      return Topics.fromJson(json.decode(reponse.body));
    } else {
      throw Exception("Failed code");
    }
  }
}
