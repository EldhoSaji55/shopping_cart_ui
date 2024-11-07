import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_cart_ui/model/product_model.dart';

class Homescreencontroller with ChangeNotifier {
  List categoryList = [];
  bool isLoading = false;
  bool isProductLoading = false;
  int selectedCategoryIndex = 0;
  List<ProductModel> productList = [];
  Future<void> getCategories() async {
    var url = Uri.parse("https://fakestoreapi.com/products/categories");
    try {
      isLoading = true;
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
        var convertjson = jsonDecode(response.body);

        categoryList = convertjson;
        categoryList.insert(0, "All");
        print('list : $categoryList');
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }

  onCategorySelection(int clickedIndex) async {
    selectedCategoryIndex = clickedIndex;
    await getAllProducts();
    notifyListeners();
  }

  getAllProducts() async {
    final allProductsUrl = Uri.parse("https://fakestoreapi.com/products");
    final productByCategoryUrl =
        Uri.parse("https://fakestoreapi.com/products/category/jewelery");
    isProductLoading = true;
    notifyListeners();
    try {
      final response = await http.get(
          selectedCategoryIndex == 0 ? allProductsUrl : productByCategoryUrl);
      if (response.statusCode == 200) {
        productList = productModelFromJson(response.body);
      }
    } catch (e) {}
    isProductLoading = false;
    notifyListeners();
  }
}
