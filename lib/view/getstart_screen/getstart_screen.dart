import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart_ui/view/home_screen/home_screen.dart';

class GetstartScreen extends StatelessWidget {
  const GetstartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 30),
                child: Text(
                  "Define yourself in your unique way.",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                          height: 1)),
                ),
              ),
              Container(
                child: Image.asset(
                  "assets/images/gtsart_model.jpg",
                ),
              ),
            ]),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
          color: Colors.white,
          child: MaterialButton(
            textColor: Colors.white,
            color: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Get Started  ",
                  style: TextStyle(fontSize: 18),
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 30,
                )
              ],
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            },
          ),
        ));
  }
}
