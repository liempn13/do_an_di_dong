class QuestionSetsDetail {
  QuestionSetsDetail({required this.questionsSetID, required this.questionID});
  int questionsSetID;
  int questionID;

  factory QuestionSetsDetail.fromJson(Map<String, dynamic> json) {
    return QuestionSetsDetail(
        questionsSetID: json["question_set_id"],
        questionID: json["question_id"]);
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["question_set_id"] = questionsSetID;
    map["question_id"] = questionID;
    return map;
  }
}
