import 'package:flutter/material.dart';
import 'package:shopping_cart_ui/getstart_screen/getstart_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GetstartScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
