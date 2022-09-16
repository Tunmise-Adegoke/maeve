import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeve/bloc/cart_bloc/cart_bloc.dart';
import 'package:maeve/bloc/cart_bloc/cart_state.dart';
import 'package:maeve/model/furniture_model.dart';
import 'package:maeve/screens/cart/cart_product_card.dart';
import 'package:maeve/utils/constant.dart';

import 'cart_total.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Cart',
          style: kMediumTextstyle,
        ),
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        List<Furniture> cart = state.cart;
        // // ignore: unnecessary_type_check

        // if (state is CartState) {
        //   return state.cart.isEmpty
        //       ? const Center(
        //           child: Text(
        //           'Cart is Empty',
        //           style: kSmallTextstyle,
        //         ))
        // :
        return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: cart.length,
            itemBuilder: (context, index) {
              return CartProductCard(
                index: index,
              );
            });
      }),
      bottomSheet: const CartTotal(),
    );
  }
}
