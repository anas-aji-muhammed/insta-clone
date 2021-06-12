import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riafy_challenge/HomePage/presentation/manager/homepage_controller.dart';
import 'package:riafy_challenge/core/bindings/home_page_binding.dart';

import 'HomePage/data/local/data_sources/hive_config.dart';
import 'HomePage/presentation/pages/homepage.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomePageBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageScreen(),
    );
  }
}
