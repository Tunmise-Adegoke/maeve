import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maeve/cart.dart';
import 'package:maeve/controller/getx_controller.dart';
import 'package:maeve/furniture_card.dart';
import 'package:maeve/model/furniture_model.dart';
import 'package:maeve/utils/constant.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final scrollController = ScrollController(initialScrollOffset: 0);
final List<String> imgList = [
  'assets/images/slider sofa 1.jpg',
  'assets/images/slider mirror 1.jpg',
  'assets/images/slider chair 2.jpg',
  'assets/images/slider table 1.jpg',
  'assets/images/slider chair 1.jpg',
  'assets/images/slider hammock.jpg',
  'assets/images/slider mirror 2.jpg',
  'assets/images/slider sofa 2.jpg',
  'assets/images/slider chair 3.jpg',
  'assets/images/slider_sofa and mirror 1.jpg',
];

class _HomePageState extends State<HomePage> {
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              'MAEVE',
              style: kMediumTextstyle,
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            actions: [
              Badge(
                position: BadgePosition.topEnd(top: 5, end: 5),
                badgeContent: Text(
                    // cartController.addProducts.toString(),
                    cartController.totalQty.value.toString()),
                showBadge: true,
                badgeColor: Colors.red,
                child: IconButton(
                    onPressed: () {
                      Get.to(() => CartPage());
                    },
                    icon: Icon(
                      Icons.shopping_cart_checkout_rounded,
                      color: Colors.black,
                    )),
              )
            ]),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            SizedBox(
              height: h * 0.005,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                'Make your Home with',
                style: TextStyle(
                  fontSize: w * 0.06,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(
              height: h * 0.005,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                'Luxury and Comfort',
                style: TextStyle(
                  fontSize: w * 0.06,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(
              height: h * 0.010,
            ),
            CarouselSlider(
              items: imgList
                  .map((item) => Container(
                        width: 1000,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              image: AssetImage(item), fit: BoxFit.cover),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true),
            ),
            SizedBox(
              height: h * 0.010,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Discover',
                style: kMediumTextstyle,
              ),
            ),
            SizedBox(
              height: h * 0.010,
            ),
            GridView.builder(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.only(left: 10, right: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: (1 / 1.5)),
                itemBuilder: (BuildContext context, int index) {
                  return FurnitureCard(
                    index: index,
                  );
                },
                itemCount: Furniture.furniture.length),
          ],
        ),
      ),
    );
  }
}
