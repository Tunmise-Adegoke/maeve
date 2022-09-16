part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddProducts extends CartEvent {
  final int index;
  const AddProducts({required this.index});
  @override
  List<Object> get props => [index];
}

class RemoveProducts extends CartEvent {
  final int index;
  const RemoveProducts({required this.index});
  @override
  List<Object> get props => [index];
}

class IncreaseProducts extends CartEvent {
  final int counter;
  const IncreaseProducts({required this.counter});
  @override
  List<Object> get props => [counter];
}

class DecreaseProducts extends CartEvent {
  final int counter;
  const DecreaseProducts({required this.counter});
  @override
  List<Object> get props => [counter];
}
