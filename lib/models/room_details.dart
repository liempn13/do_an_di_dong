

class RoomDetails {
  RoomDetails(
      {required this.ID, required this.opponentID, required this.roomID});
  int ID;
  int opponentID;
  int roomID;
  factory RoomDetails.fromJson(Map<String, dynamic> json) {
    return RoomDetails(
        opponentID: json["id"],
        ID: json["opponent_id"],
        roomID: json["room_id"]);
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["id"] = ID;
    map["opponent_id"] = opponentID;
    map["room_id"] = roomID;
    return map;
  }
}
