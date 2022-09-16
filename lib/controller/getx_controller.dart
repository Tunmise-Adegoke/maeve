// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:maeve/model/cart_model.dart';
// import 'package:maeve/model/furniture_model.dart';

// class CartController extends GetxController {
//   final Map<int, CartModel> _furniture = {};
//   Map<int, CartModel> get furniture => _furniture;
//   final numOfItems = 1.obs;
//   final totalQty = 0.obs;

//   void addProducts(Furniture furniture) {
//     if (_furniture.containsKey(furniture.id)) {
//       _furniture.update(furniture.id, (value) {
//         return CartModel(
//             id: value.id,
//             title: value.title,
//             price: value.price,
//             image: value.image,
//             quantity: value.quantity + 1,
//             furniture: furniture);
//       });
//     } else {
//       _furniture.putIfAbsent(furniture.id, () {
//         return CartModel(
//             id: furniture.id,
//             title: furniture.title,
//             price: furniture.price,
//             image: furniture.image,
//             quantity: 1,
//             furniture: furniture);
//       });
//     }
//     getTotal();

//     Get.snackbar('Product Added', 'You have added ${furniture.title} to cart',
//         snackPosition: SnackPosition.BOTTOM,
//         duration: const Duration(seconds: 2),
//         backgroundColor: Colors.white);
//     update();
//   }

//   void getTotal() {
//     totalQty.value = _furniture.length;
//   }

//   // get furniture => _furniture;
//   // get productSubtotal {
//   //   _furniture.entries
//   //       .map((e) => furniture.key.price * furniture.value)
//   //       .toList();
//   // }

//   int get productTotal {
//     int total = 0;
//     _furniture.forEach((key, value) {
//       total += value.price * value.quantity;
//     });
//     return total;
//   }

//   void removeFurniture(int id) {
//     _furniture.remove(id);
//     getTotal();
//     update();
//   }
// }
