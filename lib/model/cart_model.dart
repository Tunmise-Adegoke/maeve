import 'package:maeve/model/furniture_model.dart';

class CartModel {
  final int id;
  final String title;
  final int price;
  final String image;
  final int quantity;
  final Furniture furniture;

  CartModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.image,
      required this.quantity,
      required this.furniture
      });
}
