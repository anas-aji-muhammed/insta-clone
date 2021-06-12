// To parse this JSON data, do
//
//     final commentsModel = commentsModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class CommentsModel {
  CommentsModel({
    required this.username,
    required this.comments,
  });

  String username;
  String comments;

  factory CommentsModel.fromJson(String str) => CommentsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentsModel.fromMap(Map<String, dynamic> json) => CommentsModel(
    username: json["username"],
    comments: json["comments"],
  );

  Map<String, dynamic> toMap() => {
    "username": username,
    "comments": comments,
  };
}
