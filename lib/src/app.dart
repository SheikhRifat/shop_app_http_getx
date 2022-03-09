import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/src/pages/splash_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.onlyBuilder,
      home: SplashPage(),
    );
  }
}
