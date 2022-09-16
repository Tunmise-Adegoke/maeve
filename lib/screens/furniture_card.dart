import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:maeve/bloc/cart_bloc/cart_bloc.dart';
import 'package:maeve/model/furniture_model.dart';
import 'package:maeve/utils/constant.dart';

import '../bloc/cart_bloc/cart_state.dart';

class FurnitureCard extends StatelessWidget {
  final int index;
  // final cartController = Get.put(CartController());
  const FurnitureCard({
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                Furniture.furniture[index].title,
                style: kSmallTextstyle,
              ),
            ),
            SizedBox(
              height: h * 0.005,
            ),
            Expanded(
              child: Text(
                NumberFormat.currency(locale: 'en', symbol: '₦')
                    .format(Furniture.furniture[index].price)
                    .toString(),
                style: kSmallTextstyle,
              ),
            ),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    context.read<CartBloc>().add(AddProducts(index: index));
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Wrap(
                        spacing: 10,
                        children: const [
                          Icon(Icons.shopping_basket_outlined),
                          Text(
                            'shop',
                            style: kSmallTextstyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ]),
        ),
      ),
    );
  }
}
