// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String message;
  UserClass user;
  Token token;

  User({
    required this.message,
    required this.user,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    message: json["message"],
    user: UserClass.fromJson(json["user"]),
    token: Token.fromJson(json["token"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user.toJson(),
    "token": token.toJson(),
  };
}

class Token {
  String accessToken;

  Token({
    required this.accessToken,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    accessToken: json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
  };
}

class UserClass {
  String id;
  String userType;
  String firstName;
  String lastName;
  String username;

  UserClass({
    required this.id,
    required this.userType,
    required this.firstName,
    required this.lastName,
    required this.username,
  });

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
    id: json["id"],
    userType: json["user_type"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_type": userType,
    "first_name": firstName,
    "last_name": lastName,
    "username": username,
  };
}
