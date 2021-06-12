import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riafy_challenge/HomePage/data/local/models/insta_feed_model.dart';
import 'package:riafy_challenge/HomePage/data/remote/models/insta_feed_model.dart';
import 'package:riafy_challenge/HomePage/presentation/manager/homepage_controller.dart';
import 'package:riafy_challenge/HomePage/presentation/widgets/bottom_sheet_comment.dart';

class InstaIndividualFeedItem extends StatefulWidget {
  const InstaIndividualFeedItem({Key? key,required this.post, required this.postIndex}) : super(key: key);

  final InstaFeedModel post;
  final int postIndex;

  @override
  _InstaIndividualFeedItemState createState() =>
      _InstaIndividualFeedItemState();
}

class _InstaIndividualFeedItemState extends State<InstaIndividualFeedItem> {
  HomePageController homePageController = Get.find();
  bool showMore = false;
  bool enableShowMore = false;
  late String descPart1;
  late String descPart2;
  bool favouriteTapped = false;
  @override
  void initState() {
    super.initState();
    loadDescription();

  }

  loadDescription(){
    if(widget.post.title.length>50){
      descPart1 = widget.post.title.substring(0, 50);
      descPart2 = widget.post.title.substring(50, widget.post.title.length);
      setState(() {
        showMore = true;
      });
    }
    else{
      descPart1 = widget.post.title;
      descPart2 = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        foregroundColor: Colors.orangeAccent,

                      ),
                      SizedBox(width: 5,),
                      Text(widget.post.channelname),
                    ],
                  ),
                ),
                Icon(Icons.more_vert)
              ],
            ),

            SizedBox(height: 5,),
            Image.network(widget.post.mediumThumbnail, fit: BoxFit.contain, ),
            SizedBox(height: 5,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(Icons.favorite_outline),
                      Icon(Icons.chat_bubble_outline_rounded),
                      Icon(Icons.share),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    homePageController.addPostToFavourite(
                        InstaFeedModelLocal(
                            id: homePageController.instaFeeds[widget.postIndex].id,
                            channelname: homePageController.instaFeeds[widget.postIndex].channelname,
                            title: homePageController.instaFeeds[widget.postIndex].title,
                            highThumbnail: homePageController.instaFeeds[widget.postIndex].highThumbnail,
                            lowThumbnail: homePageController.instaFeeds[widget.postIndex].lowThumbnail,
                            mediumThumbnail: homePageController.instaFeeds[widget.postIndex].mediumThumbnail,
                            tags: []
                        )
                    );
                    setState(() {
                      favouriteTapped = !favouriteTapped;
                    });
                  },
                    child: Icon((favouriteTapped)?Icons.bookmark:Icons.bookmark_border)
                )
              ],
            ),
            SizedBox(height: 5,),
            Row(
              children: [

                SizedBox(height: 5,),
                Text("Liked by "),
                Text(widget.post.channelname + " ", style:  TextStyle(fontWeight: FontWeight.bold),),
                Text("and "),
                Text("6521 others.",  style:  TextStyle(fontWeight: FontWeight.bold),),

              ],
            ),

            (showMore)?
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(descPart1 + "..."),
                  InkWell(
                    onTap: (){
                      setState(() {
                        showMore = !showMore;
                      });
                    },
                      child: Text(showMore? "Show more": "Show less", style: TextStyle(color: Colors.blueAccent),)
                  )
                ],
              ):
              Text(descPart1 + descPart2),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: InkWell(
                onTap: (){
                  homePageController.getComments();
                  Get.bottomSheet(
                    BottomSheet(
                        onClosing: (){},
                        builder: (c){
                          return InstaCommentBottomSheet();
                        }
                    )
                  );
                },
                  child: Text("View all Comments.", style: TextStyle(color: Colors.blueAccent))
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  hintText: "Add a comment...",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
