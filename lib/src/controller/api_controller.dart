import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/src/model/product.dart';

class ApiController {
  final url = 'https://fakestoreapi.com/products';
  final url2 = 'https://fakestoreapi.com/products/category/';
  final url3 = 'https://fakestoreapi.com/products/categories';

  getProducts() async {
    print('Firing happening here-------------');
    final res = await http.get(Uri.parse(url));
    Iterable l = json.decode(res.body);
    List<Product> products =
        List<Product>.from(l.map((model) => Product.fromJson(model)));
    print(products);
    print('Firing happening donehere-------------');

    return products;
  }

  getCategory(String categoryName) async {
    var response = await http.get(Uri.parse(url2 + categoryName));
    return json.decode(response.body);
  }

  getCategories() async {
    var response = await http.get(Uri.parse(url3));
    var categoriesJson = json.decode(response.body);
    return categoriesJson;
  }
}
