import 'package:get/get.dart';
import 'package:shop_app/src/controller/api_controller.dart';

class ProductController extends GetxController {
  ApiController apiController = ApiController();
  RxBool isLoading = false.obs;
  List products = [].obs;
  final showGrid = false.obs;

  ProductController() {
    getProductsload();
  }
  getProductsload() async {
    isLoading(true);
    products = await apiController.getProducts();
    isLoading(false);
  }

  toggleGrid() {
    showGrid(!showGrid.value);
  }
}
