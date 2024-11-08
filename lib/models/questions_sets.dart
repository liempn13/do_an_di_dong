class QuestionsSets {
  QuestionsSets(
      {this.questionsSetID,
      required this.questionsSetName,
      required this.topicID,
      required this.questionQuantity});
  int? questionsSetID;
  String questionsSetName;
  int topicID;
  int questionQuantity;
  factory QuestionsSets.fromJson(Map<String, dynamic> json) {
    return QuestionsSets(
        questionsSetID: json["question_set_id"],
        questionsSetName: json["question_set_name"],
        topicID: json["topic_id"],
        questionQuantity: json["question_quantity"]);
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["question_set_id"] = questionsSetID;
    map["question_set_name"] = questionsSetName;
    map["topic_id"] = topicID;
    map["question_quantity"] = questionQuantity;
    return map;
  }
}
