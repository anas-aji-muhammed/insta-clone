import 'package:get/get.dart';
import 'package:riafy_challenge/HomePage/data/local/data_sources/hive_config.dart';
import 'package:riafy_challenge/HomePage/data/local/models/insta_feed_model.dart';
import 'package:riafy_challenge/HomePage/data/remote/models/comments_model.dart';
import 'package:riafy_challenge/HomePage/data/remote/models/insta_feed_model.dart';
import 'package:riafy_challenge/HomePage/data/repositories/insta_feed_repo.dart';

class HomePageController extends GetxController{
  InstaFeedRepo instaFeedRepo = InstaFeedRepo();
  List<InstaFeedModel> instaFeeds = [];
  List<InstaFeedModelLocal> favFeeds = [];
  List<CommentsModel> comments = [];
  final loading = true.obs;
  final commentsLoading = true.obs;
  HiveConfig _hiveConfig = HiveConfig();
  final favouriteNavClicked = false.obs;
  final homeNavClicked = true.obs;

  onMenuTap(){
    getFavPosts();
  }

  ///Get all feeds from the remote repo
  getAllFeeds() async {
    loading.value = true;
    print("Get feeds in HomePageController called");
    instaFeeds = await instaFeedRepo.getInstaFeeds();
    print(instaFeeds);
    loading.value = false;

  }
  initialiseHiveBoxes() async {
    await _hiveConfig.openAllBoxes();
  }

  addPostToFavourite(InstaFeedModelLocal? post) async {
    print("addPostToFavourite in HomePageController called");
    instaFeedRepo.addFavouritePost(post!);
  }

  getFavPosts() async {
    loading.value = true;
    print("getFavPosts in HomePageController called");
    favFeeds = await instaFeedRepo.getFavouriteInstaFeeds();
    print(instaFeeds);
    loading.value = false;
  }

  getComments() async {
    commentsLoading.value = true;
    print("getComments in HomePageController called");
    comments = await instaFeedRepo.getComments();
    print("getComments in HomePageController got response");
    print(comments);
    commentsLoading.value = false;
  }




}