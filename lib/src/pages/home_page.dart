import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/src/controller/base_controller.dart';
import 'package:shop_app/src/model/product.dart';
import 'package:shop_app/src/pakages/ktext.dart';

class HomePage extends StatelessWidget with BaseController {
  final List categories = [
    "TShirt",
    "Pants",
    "Jeans",
    "Jackets",
    "Shirt",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    return Scaffold(
      appBar: _buildAppbar(),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          _buildTop(),
          _buildCategories(),
          Expanded(
            child: Obx(() {
              if (productsC.isLoading.value == true) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (productsC.products.isEmpty) {
                return Center(
                  child: KText(
                    text: 'No products found',
                  ),
                );
              }
              // grid item..
              //.............
              if (productsC.showGrid.value) {
                return GridView.builder(
                  padding: EdgeInsets.only(top: 16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // mainAxisSpacing: 10,
                    // crossAxisSpacing: 10,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: productsC.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    Product item = productsC.products[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.all(8),
                          height: 150,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(),
                                child: CachedNetworkImage(
                                  fadeInCurve: Curves.easeIn,
                                  fadeInDuration: Duration(microseconds: 300),
                                  imageUrl: item.image.toString(),
                                  progressIndicatorBuilder:
                                      (context, url, progress) {
                                    return ColoredBox(
                                      color: Colors.black12,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          value: progress.progress,
                                        ),
                                      ),
                                    );
                                  },
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      KText(
                                        text: item.title.toString(),
                                        fontWeight: FontWeight.bold,
                                        maxLines: 1,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      KText(
                                        text: item.description.toString(),
                                        maxLines: 2,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      KText(
                                        text: '\$${item.price}',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              return buildList();
            }),
          ),
        ],
      ),
    );
  }

// list item
//.........
  ListView buildList() {
    return ListView.builder(
        padding: EdgeInsets.only(top: 16),
        itemCount: productsC.products.length,
        itemBuilder: (BuildContext context, int index) {
          Product item = productsC.products[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(8),
                height: 150,
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      width: 130,
                      decoration: BoxDecoration(),
                      child: CachedNetworkImage(
                        fadeInCurve: Curves.easeIn,
                        fadeInDuration: Duration(microseconds: 300),
                        imageUrl: item.image.toString(),
                        progressIndicatorBuilder: (context, url, progress) {
                          return ColoredBox(
                            color: Colors.black12,
                            child: Center(
                              child: CircularProgressIndicator(
                                value: progress.progress,
                              ),
                            ),
                          );
                        },
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            KText(
                              text: item.title.toString(),
                              fontWeight: FontWeight.bold,
                              maxLines: 1,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            KText(
                              text: item.description.toString(),
                              maxLines: 3,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            KText(
                              text: '\$${item.price}',
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: KText(
        text: 'Shop Demo',
        color: Colors.black,
        fontSize: 16,
      ),
      iconTheme: IconThemeData(color: Colors.black),
      leading: Icon(EvaIcons.menu),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              EvaIcons.searchOutline,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              EvaIcons.bellOutline,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              EvaIcons.shoppingCartOutline,
            )),
      ],
    );
  }

  Row _buildTop() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cloths",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_down),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              productsC.toggleGrid();
            },
            icon: Icon(Icons.filter_list)),
      ],
    );
  }

  Container _buildCategories() {
    return Container(
      height: 35.0,
      margin: EdgeInsets.only(top: 16),
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            margin: EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: index == 0 ? Colors.green : Colors.grey[200],
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              categories[index],
              style: TextStyle(
                color: index == 0 ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
