import 'package:get/get.dart';
import 'package:shop_app/src/controller/api_controller.dart';

class CartController extends GetxController {
  ApiController apiController = ApiController();
  var cartItems = [];
  var loading = false.obs;
  var subtotal = 0.0.obs;

  CartController() {
    loadCartFromApi();
  }
  loadCartFromApi() async {
    loading(true);
    var productsList = await apiController.getCart();

    for (var i = 0; i < productsList.length; i++) {
      var product =
          await apiController.getProduct1(productsList[i]["productId"]);
      subtotal(subtotal.value + product["price"] * productsList[i]["quantity"]);
      cartItems
          .add({"product": product, "quantity": productsList[i]["quantity"]});
    }
    loading(false);
  }
}
