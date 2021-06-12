// To parse this JSON data, do
//
//     final instaFeedModel = instaFeedModelFromMap(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
part 'insta_feed_model.g.dart';
@HiveType(typeId: 1)
class InstaFeedModelLocal {
  InstaFeedModelLocal({
    required this.id,
    required this.channelname,
    required this.title,
    required this.highThumbnail,
    required this.lowThumbnail,
    required this.mediumThumbnail,
    required this.tags,
  });
  @HiveField(0)
  String id;
  @HiveField(1)
  String channelname;
  @HiveField(2)
  String title;
  @HiveField(3)
  String highThumbnail;
  @HiveField(4)
  String lowThumbnail;
  @HiveField(5)
  String mediumThumbnail;
  @HiveField(6)
  List<dynamic> tags;

  factory InstaFeedModelLocal.fromJson(String str) => InstaFeedModelLocal.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InstaFeedModelLocal.fromMap(Map<String, dynamic> json) => InstaFeedModelLocal(
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
