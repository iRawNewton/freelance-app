// To parse this JSON data, do
//
//     final useridModel = useridModelFromJson(jsonString);

import 'dart:convert';

List<UseridModel> useridModelFromJson(String str) => List<UseridModel>.from(
    json.decode(str).map((x) => UseridModel.fromJson(x)));

String useridModelToJson(List<UseridModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UseridModel {
  String userId;

  UseridModel({
    required this.userId,
  });

  factory UseridModel.fromJson(Map<String, dynamic> json) => UseridModel(
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
      };
}
