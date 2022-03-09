import 'package:get/get.dart';
import 'package:shop_app/src/controller/product_controller.dart';

class BaseController {
  final productsC = Get.put(ProductController());
}
