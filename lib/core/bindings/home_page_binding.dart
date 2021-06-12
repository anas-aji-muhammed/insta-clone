import 'package:get/get.dart';
import 'package:riafy_challenge/HomePage/presentation/manager/homepage_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}