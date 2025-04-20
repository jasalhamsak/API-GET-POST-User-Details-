// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  bool success;
  Data data;
  String message;
  dynamic errors;

  PostModel({
    required this.success,
    required this.data,
    required this.message,
    required this.errors,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
    errors: json["errors"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
    "errors": errors,
  };
}

class Data {
  int id;
  String role;
  String firstName;
  dynamic lastName;
  String username;
  String mobile;
  String email;
  String token;

  Data({
    required this.id,
    required this.role,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.mobile,
    required this.email,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    role: json["role"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    username: json["username"],
    mobile: json["mobile"],
    email: json["email"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "role": role,
    "first_name": firstName,
    "last_name": lastName,
    "username": username,
    "mobile": mobile,
    "email": email,
    "token": token,
  };
}
