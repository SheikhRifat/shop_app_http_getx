import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/src/controller/cart_controller.dart';
import 'package:shop_app/src/pakages/ktext.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartController cartC = CartController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: Obx(() {
          if (cartC.loading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (cartC.cartItems.isEmpty) {
            return Center(
              child: KText(
                text: 'No cart items found',
              ),
            );
          }
          return Stack(
            children: [
              Container(),
              Positioned.fill(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cartC.cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Container(
                        height: 130,
                        padding: EdgeInsets.all(10),
                        width: 100,
                        margin: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    cartC.cartItems[index]['product']['image'],
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    KText(
                                      text: cartC.cartItems[index]['product']
                                          ['title'],
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      maxLines: 3,
                                    ),
                                    Expanded(
                                        child: KText(
                                      text: cartC.cartItems[index]['product']
                                          ['description'],
                                      maxLines: 3,
                                    )),
                                    KText(
                                      text:
                                          '\$${cartC.cartItems[index]['product']['price']}',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Container(
                                    color: Colors.grey[200],
                                    child: Icon(Icons.remove)),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    child: KText(
                                        text: cartC.cartItems[index]['quantity']
                                            .toString())),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    color: Colors.grey[200],
                                    child: Icon(Icons.add)),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              bottom()
            ],
          );
        }));
  }

  Positioned bottom() {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(bottom: 8, left: 10, right: 10, top: 5),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    KText(
                      text: 'Subtotal',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        KText(
                          text: '\$${cartC.subtotal}',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        KText(
                          text: 'Subtotal does not included shipping',
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          onPressed: () {},
                          child: KText(
                            text: 'Checkout',
                            color: Colors.white,
                            fontSize: 16,
                          )),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              primary: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black54),
                                borderRadius: BorderRadius.circular(10),
                              )),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              KText(text: 'Checkout with '),
                              Container(
                                height: 20,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://logos-download.com/wp-content/uploads/2022/01/BKash_Logo-700x287.png'))),
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
              KText(text: 'Continue shopping')
            ],
          ),
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Cart",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.share_outlined)),
      ],
      iconTheme: IconThemeData(color: Colors.black),
    );
  }
}
