import 'package:get/get.dart';
import 'package:shop_app/src/controller/auth_controller.dart';

import 'package:shop_app/src/controller/product_controller.dart';

class BaseController {
  final productsC = Get.put(ProductController());
  final authC = Get.put(AuthController());
}
