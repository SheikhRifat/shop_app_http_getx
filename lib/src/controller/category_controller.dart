import 'package:get/get.dart';
import 'package:shop_app/src/controller/api_controller.dart';

class CategoryController extends GetxController {
  ApiController apiController = ApiController();
  List products = [].obs;
  var showGrid = false.obs;
  var loading = false.obs;

  getCategoryLoad(String categoryName) async {
    loading(true);
    products = await apiController.getCategory(categoryName);
    loading(false);
  }

  toggleGrid() {
    showGrid(!showGrid.value);
  }
}
