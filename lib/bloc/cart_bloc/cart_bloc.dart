import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maeve/bloc/cart_bloc/cart_state.dart';
import 'package:maeve/model/furniture_model.dart';

part 'cart_event.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<AddProducts>((event, emit) {
      final state = this.state;
    // state.cart.add(Furniture.furniture[event.index]);
      emit(CartState(
          cart: List.from(state.cart)..add(Furniture.furniture[event.index])));
    });

    on<RemoveProducts>((event, emit) {
      final state = this.state;
      emit(CartState(
          cart: List.from(state.cart)
            ..remove(Furniture.furniture[event.index])));
    });
  }
}
