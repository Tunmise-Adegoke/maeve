// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:maeve/model/furniture_model.dart';



// ignore: must_be_immutable
class CartState extends Equatable {
  List<Furniture> cart;

  CartState({this.cart = const <Furniture>[]});

  @override
  List<Object?> get props => [cart];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cart': cart.map((x) => x.toMap()).toList(),
    };
  }

  factory CartState.fromMap(Map<String, dynamic> map) {
    return CartState(
      cart: List<Furniture>.from((map['cart'] as List<int>).map<Furniture>((x) => Furniture.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartState.fromJson(String source) => CartState.fromMap(json.decode(source) as Map<String, dynamic>);
}

// class CartLoading extends CartState {
//   @override
//   List<Object> get props => [];
// }

// class CartLoaded extends CartState {
//   @override
//   final CartModel cartModel;
//   const CartLoaded({required this.cartModel});
//   @override
//   List<Object> get props => [cartModel];
// }
