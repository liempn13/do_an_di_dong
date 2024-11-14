class HistoryDetails {
  HistoryDetails(
      {required this.idHistory,
      required this.questionID,
      required this.optionID});
  int idHistory;
  int optionID;
  int questionID;

  factory HistoryDetails.fromJson(Map<String, dynamic> json) {
    return HistoryDetails(
        idHistory: json["id_history"],
        optionID: json["option_id"],
        questionID: json["question_id"]);
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["id_history"] = idHistory;
    map["question_id"] = questionID;
    map["option_id"] = optionID;
    return map;
  }
}
