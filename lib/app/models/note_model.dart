// To parse this JSON data, do
//
//     final note = noteFromJson(jsonString);

import 'dart:convert';

List<Note> noteFromJson(String str) => List<Note>.from(json.decode(str).map((x) => Note.fromJson(x)));

String noteToJson(Note data) => json.encode(data.toJson());

class Note {
  String id;
  String title;
  String description;
  String content;
  DateTime createdDate;
  DateTime lastAccessed;

  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.createdDate,
    required this.lastAccessed,
  });

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    content: json["content"],
    createdDate: DateTime.parse(json["created_date"]),
    lastAccessed: DateTime.parse(json["last_accessed"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "content": content,
    "created_date": createdDate.toIso8601String(),
    "last_accessed": lastAccessed.toIso8601String(),
  };
}
