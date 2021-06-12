// To parse this JSON data, do
//
//     final instaFeedModel = instaFeedModelFromMap(jsonString);

import 'dart:convert';

class InstaFeedModel {
  InstaFeedModel({
    required this.id,
    required this.channelname,
    required this.title,
    required this.highThumbnail,
    required this.lowThumbnail,
    required this.mediumThumbnail,
    required this.tags,
  });

  String id;
  String channelname;
  String title;
  String highThumbnail;
  String lowThumbnail;
  String mediumThumbnail;
  List<dynamic> tags;

  factory InstaFeedModel.fromJson(String str) => InstaFeedModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InstaFeedModel.fromMap(Map<String, dynamic> json) => InstaFeedModel(
    id: json["id"],
    channelname: json["channelname"],
    title: json["title"],
    highThumbnail: json["high thumbnail"],
    lowThumbnail: json["low thumbnail"],
    mediumThumbnail: json["medium thumbnail"],
    tags: List<dynamic>.from(json["tags"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "channelname": channelname,
    "title": title,
    "high thumbnail": highThumbnail,
    "low thumbnail": lowThumbnail,
    "medium thumbnail": mediumThumbnail,
    "tags": List<dynamic>.from(tags.map((x) => x)),
  };
}
