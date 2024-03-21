import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:productos_app/model/models.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _baseUrl =
      "flutterproductosapp-66677-default-rtdb.firebaseio.com";

  final List<Product> products = [];
  bool isLoding = true;
  ProductsService() {
    loadProducts();
  }
  Future loadProducts() async {
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = jsonDecode(resp.body);

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });

    print(products[0].name);
  }
}
