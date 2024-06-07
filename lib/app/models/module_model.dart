// To parse this JSON data, do
//
//     final module = moduleFromJson(jsonString);

import 'dart:convert';

List<Module> moduleFromJson(String str) => List<Module>.from(json.decode(str).map((x) => Module.fromJson(x)));

String moduleToJson(List<Module> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Module {
  String id;
  String title;
  DateTime createdDate;
  DateTime lastAccessed;

  Module({
    required this.id,
    required this.title,
    required this.createdDate,
    required this.lastAccessed,
  });

  factory Module.fromJson(Map<String, dynamic> json) => Module(
    id: json["_id"],
    title: json["title"],
    createdDate: DateTime.parse(json["created_date"]),
    lastAccessed: DateTime.parse(json["last_accessed"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "created_date": "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
    "last_accessed": lastAccessed.toIso8601String(),
  };
}
