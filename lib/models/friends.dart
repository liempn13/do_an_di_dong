import 'dart:ffi';

class Friends {
  Friends({required this.userID, required this.friendID});
  int userID;
  int friendID;

  factory Friends.fromJson(Map<String, dynamic> json) {
    return Friends(
      userID: json["user_id"],
      friendID: json["friend_id"],
    );
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["user_id"] = userID;
    map["friend_id"] = friendID;
    return map;
  }
}
