import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeve/bloc/cart_bloc/cart_bloc.dart';
import 'package:maeve/bloc/cart_bloc/cart_state.dart';
import 'package:maeve/model/furniture_model.dart';
import 'package:maeve/screens/cart/cart.dart';
import 'package:maeve/utils/constant.dart';

import 'furniture_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
  // final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      List<Furniture> cart = state.cart;
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
              title: const Text(
                'MAEVE',
                style: kMediumTextstyle,
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              actions: [
                Badge(
                  position: BadgePosition.topEnd(top: 5, end: 5),
                  badgeContent: Text('${cart.length}'),
                  showBadge: true,
                  badgeColor: Colors.red,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CartPage()));
                      },
                      icon: const Icon(
                        Icons.shopping_cart_checkout_rounded,
                        color: Colors.black,
                      )),
                ),
              ]),
          backgroundColor: Colors.white,
          body: ListView(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              SizedBox(
                height: h * 0.005,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  'Make your Home with',
                  style: TextStyle(
                    fontFamily: 'FiraSans',
                    fontSize: w * 0.06,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.005,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  'Luxury and Comfort',
                  style: TextStyle(
                    fontFamily: 'FiraSans',
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Discover',
                  style: kMediumTextstyle,
                ),
              ),
              SizedBox(
                height: h * 0.010,
              ),
              GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
    });
  }
}
