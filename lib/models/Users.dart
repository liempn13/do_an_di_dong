class Users {
  Users(
      {required this.userID,
      required this.userGameName,
      required this.email,
      required this.phone,
      required this.password,
      required this.isAdmin,
      required this.level,
      required this.exp,
      required this.status});
  int userID;
  String userGameName;
  String email;
  String phone;
  String password;
  int isAdmin;
  int level;
  int exp;
  int status;
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        userID: json["user_id"],
        userGameName: json["user_game_name"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        isAdmin: json["isAdmin"],
        level: json["level"],
        exp: json["exp"],
        status: json["status"]);
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["user_id"] = userID;
    map["user_game_name"] = userGameName;
    map["email"] = email;
    map["phone"] = phone;
    map["password"] = password;
    map["isAdmin"] = isAdmin;
    map["level"] = level;
    map["exp"] = exp;
    map["status"] = status;
    return map;
  }
}
