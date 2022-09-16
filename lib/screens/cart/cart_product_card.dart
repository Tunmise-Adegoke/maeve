import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:maeve/bloc/cart_bloc/cart_bloc.dart';
import 'package:maeve/model/furniture_model.dart';

import '../../bloc/cart_bloc/cart_state.dart';

class CartProductCard extends StatelessWidget {
  final int index;
  const CartProductCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Card(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
          leading: Container(
            height: h * 0.10,
            width: w * 0.10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(Furniture.furniture[index].image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            Furniture.furniture[index].title
            //  + ' ' + 'x${quality}
            ,
            style: TextStyle(
              fontSize: w * 0.04,
              fontWeight: FontWeight.normal,
            ),
          ),
          trailing: Wrap(
            spacing: 20,
            children: [
              Text(
                NumberFormat.currency(locale: 'en', symbol: '₦')
                    .format(Furniture.furniture[index].price)
                    .toString(),
                style: TextStyle(
                  fontSize: w * 0.04,
                  fontWeight: FontWeight.normal,
                ),
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      context
                          .read<CartBloc>()
                          .add(RemoveProducts(index: index));
                    },
                    child: const Icon(Icons.delete_outline_outlined),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
