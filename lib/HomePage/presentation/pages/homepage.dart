import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riafy_challenge/HomePage/data/remote/models/insta_feed_model.dart';
import 'package:riafy_challenge/HomePage/presentation/manager/homepage_controller.dart';
import 'package:riafy_challenge/HomePage/presentation/widgets/app_bar.dart';
import 'package:riafy_challenge/HomePage/presentation/widgets/bottom_navigation.dart';
import 'package:riafy_challenge/HomePage/presentation/widgets/insta_individual_feed_item.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  HomePageController homePageController = Get.find();
  @override
  void initState() {
    homePageController.getAllFeeds();
    homePageController.initialiseHiveBoxes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: InstaBottomNavigation(),
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              InstaAppBar(),
              Expanded(
                  child: Obx((){
                    if(!homePageController.loading.value){
                      if(homePageController.homeNavClicked.value){
                        return ListView.separated(
                          itemCount: homePageController.instaFeeds.length,
                          itemBuilder: (context, index){
                            return InstaIndividualFeedItem(
                              post: homePageController.instaFeeds[index], postIndex: index,
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 2,);
                          },

                        );
                      }
                      else{
                        return ListView.separated(
                          itemCount: homePageController.favFeeds.length,
                          itemBuilder: (context, index){
                            return InstaIndividualFeedItem(
                              post: InstaFeedModel(
                                  id: homePageController.favFeeds[index].id,
                                  channelname: homePageController.favFeeds[index].channelname,
                                  title: homePageController.favFeeds[index].title,
                                  highThumbnail: homePageController.favFeeds[index].highThumbnail,
                                  lowThumbnail: homePageController.favFeeds[index].lowThumbnail,
                                  mediumThumbnail: homePageController.favFeeds[index].mediumThumbnail,
                                  tags: []),
                              postIndex: index,
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 2,);
                          },

                        );
                      }
                    }
                    else{
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })
              )

            ],
          ),
        ),
      ),
    );
  }
}
