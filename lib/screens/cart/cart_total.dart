import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
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
              Text(
                'Total',
                style: TextStyle(
                  fontSize: w * 0.04,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: h * 0.010,
              ),
              Text(
                NumberFormat.currency(locale: 'en', symbol: '₦')
                    .format(234569)
                    .toString(),
                style: TextStyle(
                  fontSize: w * 0.05,
                  fontWeight: FontWeight.normal,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: h * 0.07,
                  width: w * 0.30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      'BUY NOW',
                      style: TextStyle(
                        fontSize: w * 0.04,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
