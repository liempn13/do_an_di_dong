class Topics {
  Topics({ this.topicID, required this.topicName});
  int? topicID;
  String topicName;

  factory Topics.fromJson(Map<String, dynamic> json) {
    //lay tu database toi json load len giao dien
    return Topics(
      topicID: json["topic_id"],
      topicName: json["topic_name"],
    );
  }
  Map<String, dynamic> toJson() {
    //tu giao dien thanh json xuong database
    final map = <String, dynamic>{};
    map["topic_id"] = topicID;
    map["topic_name"] = topicName;
    return map;
  }
}
