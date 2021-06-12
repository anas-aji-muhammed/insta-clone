import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' ;
import 'package:riafy_challenge/HomePage/data/local/models/insta_feed_model.dart';

class HiveConfig {
  static final HiveConfig singleton = HiveConfig._internal();
  factory HiveConfig() => singleton;
  HiveConfig._internal();
  late Box favouritePosts;

  Future<void> openAllBoxes() async {
    Hive.registerAdapter<InstaFeedModelLocal>(InstaFeedModelLocalAdapter());

    Directory appDocDir = await getApplicationDocumentsDirectory();

    Hive.init(appDocDir.path);
    favouritePosts =
        await Hive.openBox('favourite_posts');
  }
}
