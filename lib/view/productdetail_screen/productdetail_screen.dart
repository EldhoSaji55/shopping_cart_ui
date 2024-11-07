import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_ui/controller/cartscreencontroller.dart/cartScreenController.dart';
import 'package:shopping_cart_ui/controller/productDetailScreenController.dart/productDetailScreencontroller.dart';
import 'package:shopping_cart_ui/view/cart_Screen/cartScreen.dart';
import 'package:shopping_cart_ui/view/home_screen/home_screen.dart';

class ProductdetailScreen extends StatefulWidget {
  final int product_id;
  const ProductdetailScreen({super.key, required this.product_id});

  @override
  State<ProductdetailScreen> createState() => _ProductdetailScreenState();
}

class _ProductdetailScreenState extends State<ProductdetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context
            .read<Productdetailscreencontroller>()
            .getproductDetails(widget.product_id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Center(
            child: Text(
              "Details",
              style:
                  TextStyle(fontWeight: FontWeight.w800, color: Colors.black),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 10),
              child: Stack(
                children: [
                  Icon(
                    Icons.notifications_outlined,
                    size: 30,
                    color: Colors.black,
                  ),
                  Positioned(
                    right: 0,
                    top: 1,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.black,
                      child: Text(
                        "1",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        body: Consumer<Productdetailscreencontroller>(
          builder: (context, ProductDetailController, child) =>
              ProductDetailController.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    ProductDetailController.product!.image
                                        .toString(),
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  top: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.favorite_border,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              ProductDetailController.product!.title.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                SizedBox(width: 4),
                                Text(ProductDetailController.product!.rating
                                    .toString())
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              ProductDetailController.product!.rating
                                  .toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 16),
                            Text(
                              "Choose Size",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Row(
                              children: [
                                OutlinedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)))),
                                  child: Text(
                                    "S",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                OutlinedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  )),
                                  child: Text(
                                    "M",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                OutlinedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)))),
                                  child: Text(
                                    "L",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900),
                                  ),
                                )
                              ],
                            )
                            // Add size options here, e.g., using Chips or a Dropdown
                          ],
                        ),
                      ),
                    ),
        ),
        bottomNavigationBar: Consumer<Productdetailscreencontroller>(
          builder: (context, Productdetailnewcontroller, child) =>
              Productdetailnewcontroller.isLoading
                  ? Text("")
                  : BottomAppBar(
                      height: 100,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Price",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "INR ${Productdetailnewcontroller.product!.price.toString()}",
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  minimumSize:
                                      WidgetStatePropertyAll(Size(30, 50)),
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.black),
                                  foregroundColor:
                                      WidgetStatePropertyAll(Colors.white)),
                              onPressed: () {
                                context.read<Cartscreencontroller>().addProduct(
                                    Productdetailnewcontroller.product!);
                                context
                                    .read<Cartscreencontroller>()
                                    .getallproducts();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Cartscreen(),
                                    ));
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.shopping_bag_outlined),
                                  Text("Add to Cart")
                                ],
                              ))
                        ],
                      ),
                    ),
        ));
  }
}
