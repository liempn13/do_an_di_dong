import 'dart:ffi';

class QuestionsSets {
  QuestionsSets(
      {required this.questionsSetID,
      required this.questionsSetName,
      required this.topicID,
      required this.questionQuantity});
  int questionsSetID;
  String questionsSetName;
  int topicID;
  int questionQuantity;
  factory QuestionsSets.fromJson(Map<String, dynamic> json) {
    return QuestionsSets(
        questionsSetID: json["question_id"],
        questionsSetName: json["question_content"],
        topicID: json["topic_id"],
        questionQuantity: json["question_quantity"]);
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["question_id"] = questionsSetID;
    map["question_content"] = questionsSetName;
    map["topic_id"] = topicID;
    map["question_quantity"] = questionQuantity;
    return map;
  }
}
