import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:maeve/controller/getx_controller.dart';
import 'package:maeve/model/furniture_model.dart';
import 'package:maeve/utils/constant.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);
  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Cart',
          style: kMediumTextstyle,
        ),
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          _cartProductList(),
          CartTotal(),
        ],
      ),
    );
  }
}

@override
Widget _cartProductList() {
  return GetBuilder<CartController>(builder: ((controller) {
    return Container(
      color: Colors.white,
      height: 550,
      child: ListView.builder(
          itemCount: controller.furniture.length,
          itemBuilder: ((context, index) {
            return CartProductCard(
              controller: controller,
              furniture: controller.furniture.values.toList()[index].furniture,
              quality: controller.furniture.values.toList()[index].quantity,
              index: index,
            );
          })),
    );
  }));
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final Furniture furniture;
  final int quality;
  final int index;
  const CartProductCard(
      {Key? key,
      required this.controller,
      required this.furniture,
      required this.quality,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Card(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
            leading: Container(
              height: h * 0.05,
              width: w * 0.10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage(furniture.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              furniture.title + ' ' + 'x${quality}',
              style: TextStyle(
                fontSize: w * 0.06,
                fontWeight: FontWeight.normal,
              ),
            ),
            trailing: Text(
              NumberFormat.currency(locale: 'en', symbol: '₦')
                  .format(furniture.price * quality)
                  .toString(),
              style: TextStyle(
                fontSize: w * 0.06,
                fontWeight: FontWeight.normal,
              ),
            )));
  }
}

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);
  final CartController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Container(
        height: h * 0.13,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.lightGreen, borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: h * 0.030,
                  ),
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: w * 0.06,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.010,
                  ),
                  GetBuilder<CartController>(builder: ((controller) {
                    return Text(
                      NumberFormat.currency(locale: 'en', symbol: '₦')
                          .format(controller.productTotal)
                          .toString(),
                      style: TextStyle(
                        fontSize: w * 0.05,
                        fontWeight: FontWeight.normal,
                      ),
                    );
                  }))
                ],
              ),
              SizedBox(
                height: h * 0.07,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'BUY NOW',
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      textStyle: TextStyle(
                        fontSize: w * 0.05,
                        fontWeight: FontWeight.normal,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
