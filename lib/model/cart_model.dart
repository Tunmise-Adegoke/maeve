
// import 'package:equatable/equatable.dart';

// import 'package:maeve/model/furniture_model.dart';

// class CartModel extends Equatable {
//   final List<Furniture> furniture;

//   const CartModel({
//     this.furniture = const <Furniture>[],
//   });

//   @override
//   List<Object?> get props => [
//         furniture,
//       ];

//   CartModel copyWith({
//     List<Furniture>? furniture,
//   }) {
//     return CartModel(
//       furniture: furniture ?? this.furniture,
//     );
//   }

//   Map productQunatity(furniture) {
//     var quantity = {};

//     furniture.ForEach((furniture) {
//       if (!quantity.containsKey(furniture)) {
//         quantity[furniture] = 1;
//       } else {
//         quantity[furniture] += 1;
//       }
//     });
//     return quantity;
//   }

//   double get subtotal =>
//       furniture.fold(0, (total, current) => total + current.price);

//   String get subtotalString => subtotal.toStringAsFixed(2);
// }
