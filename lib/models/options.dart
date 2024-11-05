import 'dart:ffi';

class Options {
  Options(
      {required this.optionID,
      required this.optionContent,
      required this.optionValue,
      required this.questionID});
  int optionID;
  String optionContent;
  int optionValue;
  int questionID;
  factory Options.fromJson(Map<String, dynamic> json) {
    return Options(
        optionID: json["option_id"],
        optionContent: json["option_content"],
        optionValue: json["option_value"],
        questionID: json["question_id"]);
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["option_id"] = optionID;
    map["option_content"] = optionContent;
    map["option_value"] = optionValue;
    map["question_id"] = questionID;
    return map;
  }
}
