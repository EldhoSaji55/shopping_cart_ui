import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_cart_ui/model/product_model.dart';

class Productdetailscreencontroller with ChangeNotifier {
  ProductModel? product;
  bool isLoading = false;
  getproductDetails(int productId) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse("https://fakestoreapi.com/products/$productId");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        product = ProductModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {}
    isLoading = false;
    notifyListeners();
  }
}
