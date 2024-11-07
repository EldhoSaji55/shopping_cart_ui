import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_ui/controller/cartscreencontroller.dart/cartScreenController.dart';
import 'package:shopping_cart_ui/controller/homescreen_Controller/homescreenController.dart';
import 'package:shopping_cart_ui/controller/productDetailScreenController.dart/productDetailScreencontroller.dart';
import 'package:shopping_cart_ui/view/getstart_screen/getstart_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Homescreencontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => Productdetailscreencontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cartscreencontroller(),
        )
      ],
      child: MaterialApp(
        home: GetstartScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
