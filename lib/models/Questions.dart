class Questions {
  Questions(
      {required this.questionContent,
      required this.questionID,
      required this.topicID});
  int questionID;
  String questionContent;
  int topicID;
  factory Questions.fromJson(Map<String, dynamic> json) {
    return Questions(
        questionID: json["question_id"] as int,
        questionContent: json["question_content"],
        topicID: json["topic_id"] as int);
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["question_id"] = questionID;
    map["question_content"] = questionContent;
    map["topic_id"] = topicID;
    return map;
  }
}
