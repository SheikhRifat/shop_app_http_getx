import 'package:get/get.dart';
import 'package:shop_app/src/controller/api_controller.dart';
import 'package:shop_app/src/controller/category_controller.dart';

CategoryController categoryController = CategoryController();

class CategoriesController extends GetxController {
  ApiController apiController = ApiController();
  var categories = [].obs;
  var currentIndex = 0.obs;
  var loading = false.obs;

  CategoriesController() {
    loadCategories();
  }

  loadCategories() async {
    loading(true);
    var tcategories = await apiController.getCategories();
    categories(tcategories);
    if (categories.isNotEmpty) {
      await categoryController.getCategoryLoad(categories[currentIndex.value]);
    }
    loading(false);
  }

  changeCategories(index) async {
    currentIndex(index);
    await categoryController.getCategoryLoad(categories[index]);
  }
}
