class History {
  History(
      {required this.ID,
      this.roomID,
      required this.userID,
      required this.topicID,
      this.score = 0,
      this.playerQuantity = 1,
      required this.time});
  int ID;
  int? roomID;
  int userID;
  int topicID;
  int score;
  int playerQuantity;
  DateTime time;
  factory History.fromJson(Map<String, dynamic> json) {
    return History(
        ID: json["ID"],
        roomID: json["room_id"],
        userID: json["user_id"],
        topicID: json["topic_id"],
        score: json["score"],
        playerQuantity: json["player_quantity"],
        time: json["time"]);
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["ID"] = ID;
    map["room_id"] = roomID;
    map["user_id"] = userID;
    map["topic_id"] = topicID;
    map["score"] = score;
    map["player_quantity"] = playerQuantity;
    map["time"] = time;
    return map;
  }
}
