import 'dart:convert';
import 'package:do_an_di_dong/models/topics.dart';
import 'package:do_an_di_dong/constant/app_strings.dart';
import 'package:http/http.dart' as http;

class TopicsService {
  Future<http.Response> createTopics(Topics topic) async {
    //Them
    return await http.post(Uri.parse("${AppStrings.baseUrlApi}question"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(topic.toJson()));
  }

  Future<http.Response> updateTopics(Topics topic) async {
    //Sua
    return await http.put(Uri.parse("${AppStrings.baseUrlApi}question"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(topic.toJson()));
  }

  Future<http.Response> getTopicsList() async {
    //Load
    return await http.get(
      Uri.parse("${AppStrings.baseUrlApi}topics"),
    );
  }

  Future<http.Response> getTopic(int topicID) async {
    //Load
    return await http.get(
      Uri.parse("${AppStrings.baseUrlApi}"),
    );
  }
}
