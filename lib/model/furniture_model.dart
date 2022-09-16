// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Furniture extends Equatable {
  final int id;
  final String title;
  final int price;
  final String image;

  // ignore: prefer_const_constructors_in_immutables
  Furniture({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });

  static List<Furniture> furniture = [
    Furniture(
      id: 0,
      title: 'OYINBO',
      price: 150000,
      image: 'assets/images/chair 1.png',
    ),
    Furniture(
      id: 1,
      title: 'SUKANMI',
      price: 200000,
      image: 'assets/images/chair 3.png',
    ),
    Furniture(
        id: 2,
        title: 'ADUKE',
        price: 50000,
        image: 'assets/images/figurine 1.png'),
    Furniture(
      id: 3,
      title: 'DANJUMA',
      price: 250000,
      image: 'assets/images/chair 4.png',
    ),
    Furniture(
        id: 4,
        title: 'IRANTI',
        price: 60000,
        image: 'assets/images/figurine 2.png'),
    Furniture(
        id: 5,
        title: 'ORE',
        price: 40000,
        image: 'assets/images/pear figurine.png'),
    Furniture(
      id: 6,
      title: 'HALIMAH',
      price: 100000,
      image: 'assets/images/chair 6.png',
    ),
    Furniture(
        id: 7,
        title: 'DUROJAIYE',
        price: 300000,
        image: 'assets/images/sofa 2.png'),
    Furniture(
        id: 8,
        title: 'OZIOMA',
        price: 150000,
        image: 'assets/images/sofa 4.png'),
    Furniture(
        id: 9,
        title: 'TUNMISE',
        price: 400000,
        image: 'assets/images/sofa 5.png'),
    Furniture(
        id: 10,
        title: 'IFUNANYA',
        price: 300000,
        image: 'assets/images/sofa 6.png'),
    Furniture(
        id: 11,
        title: 'TIMILEYIN',
        price: 70000,
        image: 'assets/images/table 1.png'),
    Furniture(
        id: 12,
        title: 'AISHAT',
        price: 60000,
        image: 'assets/images/table 2.png'),
    Furniture(
        id: 13,
        title: 'ATOFARATI',
        price: 80000,
        image: 'assets/images/table 3.png'),
    Furniture(
        id: 14,
        title: 'ZARA',
        price: 35000,
        image: 'assets/images/table 4.png'),
    Furniture(
        id: 15,
        title: 'ADEDAYO',
        price: 25000,
        image: 'assets/images/table 5.png'),
    Furniture(
        id: 16,
        title: 'TENINUOLA',
        price: 40000,
        image: 'assets/images/table 6.png'),
    Furniture(
        id: 17,
        title: 'ADAEZE',
        price: 25000,
        image: 'assets/images/vase 1.png'),
  ];

  Furniture copyWith({
    int? id,
    String? title,
    int? price,
    String? image,
  }) {
    return Furniture(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'image': image,
    };
  }

  factory Furniture.fromMap(Map<String, dynamic> map) {
    return Furniture(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as int,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Furniture.fromJson(String source) =>
      Furniture.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        image,
      ];

  Map productQunatity(furniture) {
    var quantity = {};

    furniture.ForEach((furniture) {
      if (!quantity.containsKey(furniture)) {
        quantity[furniture] = 1;
      } else {
        quantity[furniture] += 1;
      }
    });
    return quantity;
  }

  double get totalProducts => furniture.fold(0, (total, current) {
        return total + current.price;
      });

  String get totalProductsString => totalProducts.toStringAsFixed(2);
}
