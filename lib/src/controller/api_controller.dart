import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/src/model/product.dart';

class ApiController {
  final url = 'https://fakestoreapi.com/products';
  getProducts() async {
    print('Firing happening here-------------');
    final res = await http.get(Uri.parse(url));
    final e = json.decode(res.body);
    List<Product> products =
        List<Product>.from(e.map((model) => Product.fromJson(model)));
    print(products);
    print('Firing happening donehere-------------');

    return products;
  }
}
