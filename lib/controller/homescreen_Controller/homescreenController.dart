import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homescreencontroller with ChangeNotifier {
  List? categoryList;
  Future<void> getCategories() async {
    var url = Uri.parse("https://fakestoreapi.com/products/categories");
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        log(response.body);
        var convertjson = jsonDecode(response.body);
        log(convertjson);
        categoryList = convertjson;
        print('list : $categoryList');
      }
    } catch (e) {}
    notifyListeners();
  }
}
