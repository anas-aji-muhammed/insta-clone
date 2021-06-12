import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riafy_challenge/HomePage/presentation/manager/homepage_controller.dart';

class InstaCommentBottomSheet extends StatefulWidget {
  const InstaCommentBottomSheet({Key? key}) : super(key: key);

  @override
  _InstaCommentBottomSheetState createState() =>
      _InstaCommentBottomSheetState();
}

class _InstaCommentBottomSheetState extends State<InstaCommentBottomSheet> {
  HomePageController homePageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(homePageController.commentsLoading.value){
        return Center(child: CircularProgressIndicator());
      }
      else{
        return Container(
          color: Colors.white38,
          height: MediaQuery.of(context).size.height * .8,
          child: ListView.separated(
              itemBuilder: (context, index){
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(homePageController.comments[index].username, style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(homePageController.comments[index].comments,),
                      ),

                    ],
                  ),
                );
              },
              separatorBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(),
                );
              },
              itemCount: homePageController.comments.length
          ),
        );
      }
    });
  }
}
