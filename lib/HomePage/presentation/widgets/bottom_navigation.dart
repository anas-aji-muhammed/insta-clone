
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riafy_challenge/HomePage/presentation/manager/homepage_controller.dart';

class InstaBottomNavigation extends GetResponsiveView<HomePageController>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .06,
      width: MediaQuery.of(context).size.width,
      child: Obx((){
        return BottomAppBar(
          elevation: 5.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: Icon((controller.homeNavClicked.value)?Icons.home:Icons.home_outlined),
                onTap: (){
                  controller.homeNavClicked.value = !controller.homeNavClicked.value;
                  controller.favouriteNavClicked.value = !controller.favouriteNavClicked.value;
                  controller.onMenuTap();
                },
              ),
              Icon(Icons.search),
              Icon(Icons.add_box_outlined),
              InkWell(
                child: Icon((controller.favouriteNavClicked.value)?Icons.favorite:Icons.favorite_outline),
                onTap: (){
                  controller.favouriteNavClicked.value = !controller.favouriteNavClicked.value;
                  controller.homeNavClicked.value = !controller.homeNavClicked.value;
                  controller.onMenuTap();

                },
              ),
              Icon(Icons.account_box_outlined),

            ],
          ),
        );
      }),
    );
  }

}
