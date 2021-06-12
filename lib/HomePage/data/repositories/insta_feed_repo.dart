import 'dart:convert';

import 'package:get/get_connect.dart';
import 'package:riafy_challenge/HomePage/data/local/data_sources/hive_config.dart';
import 'package:riafy_challenge/HomePage/data/local/models/insta_feed_model.dart';
import 'package:riafy_challenge/HomePage/data/remote/data_sources/api_service.dart';
import 'package:riafy_challenge/HomePage/data/remote/models/comments_model.dart';
import 'package:riafy_challenge/HomePage/data/remote/models/insta_feed_model.dart';

///Repo for fetching all feeds
class InstaFeedRepo {
  HiveConfig _hiveConfig = HiveConfig();
  ApiService apiService = ApiService();
  getInstaFeeds() async {
    print("InstaFeedRepo - getInstaFeeds Called");

    Response response = await apiService.getFeeds();
    if(response.statusCode == 200){
      List result = json.decode(response.bodyString!);
      return result.map((e) => InstaFeedModel.fromMap(e))
          .toList();
    }
    else return [];


  }


  getFavouriteInstaFeeds(){
    List<InstaFeedModelLocal> favFeeds=[];
    Iterable data = _hiveConfig.favouritePosts.values;
    data.forEach((element) {
      favFeeds.add(element);
    });
    return favFeeds;
  }

  addFavouritePost(InstaFeedModelLocal post) async {
    await _hiveConfig.favouritePosts.add(post);
  }

  getComments() async {
    print("InstaFeedRepo - getComments Called");

    Response response = await apiService.getComments();
    if(response.statusCode == 200){
      List result = json.decode(response.bodyString!);
      return result.map((e) => CommentsModel.fromMap(e))
          .toList();
    }
    else return [];
  }
}