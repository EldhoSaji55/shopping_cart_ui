import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shopping_cart_ui/model/product_model.dart';
import 'package:sqflite/sqflite.dart';

class Cartscreencontroller with ChangeNotifier {
  late Database database;
  var storedProducts;
  Future initDb() async {
    database = await openDatabase("cartdb.db", version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Cart (id INTEGER PRIMARY KEY, name TEXT, qty INTEGER, description TEXT, image TEXT, product_id INT)');
    });
  }

  getallproducts() async {
    storedProducts = await database.rawQuery('SELECT * FROM Cart');
    log(storedProducts.toString());
  }

  Future addProduct(ProductModel selectedProduct) async {
    await database.rawInsert(
        'INSERT INTO Cart(name, qty, description,image, product_id) VALUES(?, ?, ?,?,?)',
        [
          selectedProduct.title,
          1,
          selectedProduct.description,
          selectedProduct.image,
          selectedProduct.id
        ]);
  }

  incrementqty() {}
  decrementqty() {}
  removeproducts() {}
}
