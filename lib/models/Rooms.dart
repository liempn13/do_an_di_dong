
  class Rooms {
    Rooms(
        {required this.roomID,
        required this.roomCode,
        required this.roomName,
        required this.creatorID,
        required this.password,
        required this.roomStatus,
        required this.topicID});
    int roomID;
    String roomCode;
    String roomName;
    int creatorID;
    String password;
    int roomStatus;
    int topicID;
    factory Rooms.fromJson(Map<String, dynamic> json) {
      return Rooms(
          roomID: json["room_id"],
          roomCode: json["room_code"],
          roomName: json["room_name"],
          creatorID: json["creator_id"],
          password: json["password"],
          roomStatus: json["room_status"],
          topicID: json["topic_id"]);
    }
    Map<String, dynamic> toJson() {
      final map = <String, dynamic>{};
      map["room_id"] = roomID;
      map["room_code"] = roomCode;
      map["room_name"] = roomName;
      map["creator_id"] = creatorID;
      map["password"] = password;
      map["room_status"] = roomStatus;
      map["topic_id"] = topicID;
      return map;
    }
  }
