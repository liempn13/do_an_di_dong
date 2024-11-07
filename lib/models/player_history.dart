class PlayerHistory {
  PlayerHistory(
      {required this.ID,
      required this.roomID,
      required this.userID,
      required this.topicID,
      required this.score,
      required this.playerQuantity,
      required this.time});
  int ID;
  int roomID;
  int userID;
  int topicID;
  int score;
  int playerQuantity;
  DateTime time;
  factory PlayerHistory.fromJson(Map<String, dynamic> json) {
    return PlayerHistory(
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
    map["player_quantity"];
    map["time"];
    return map;
  }
}
