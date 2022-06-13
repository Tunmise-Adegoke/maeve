import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:maeve/controller/getx_controller.dart';
import 'package:maeve/model/furniture_model.dart';
import 'package:maeve/utils/constant.dart';

class FurnitureCard extends StatelessWidget {
  final int index;
  final cartController = Get.put(CartController());
  FurnitureCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: h * 0.20,
        width: w * 0.25,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(70),
        ),
        child: AspectRatio(
          aspectRatio: 0.693,
          child: Column(children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                Furniture.furniture[index].image,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: h * 0.005,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Expanded(
                  child: Text(
                Furniture.furniture[index].title,
                style: kSmallTextstyle,
              )),
            ),
            SizedBox(
              height: h * 0.005,
            ),
            Expanded(
                child: Text(
                    NumberFormat.currency(locale: 'en', symbol: '₦')
                        .format(Furniture.furniture[index].price)
                        .toString(),
                    style: kSmallTextstyle)),

            SizedBox(
              height: 40,
              width: 100,
              child: ElevatedButton.icon(
                onPressed: () {
                  cartController.addProducts(Furniture.furniture[index]);
                },
                icon: Icon(Icons.shopping_basket_outlined),
                label: Text('shop'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreen,
                    onPrimary: Colors.black,
                    textStyle: kSmallTextstyle,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            )
            // Container(
            //   height: 20,
            //   width: 100,
            //   decoration: BoxDecoration(
            //       color: Colors.white, borderRadius: BorderRadius.circular(10)),
            //   child: IconButton(
            //       onPressed: () {
            //         cartController.addProducts(Furniture.furniture[index]);
            //       },
            //       icon: Icon(
            //         Icons.shopping_basket_outlined,
            //         size: 25,
            //         color: Colors.black,
            //       )),
            // )
          ]),
        ),
      ),
    );
  }
}
