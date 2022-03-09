import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/src/controller/auth_controller.dart';
import 'package:shop_app/src/controller/base_controller.dart';
import 'package:shop_app/src/pages/home_page.dart';
import 'package:shop_app/src/pages/splash_page.dart';

class App extends StatelessWidget with BaseController {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        smartManagement: SmartManagement.onlyBuilder,
        // auth check page
        home: Obx(() {
          if (authC.authenicated.value)
            return HomePage();
          else
            return SplashPage();
        }));
  }
}
