import 'package:ecommerce/features/cart/domain/entities/cart.dart';

abstract class CartStates{}

class CartInitial extends CartStates{}

class GetCartLoading extends CartStates{}
class GetCartError extends CartStates{
  String message;
  GetCartError(this.message);
}
class GetCartSuccess extends CartStates{}

class AddToCartLoading extends CartStates{}
class AddToCartError extends CartStates{
  String message;
  AddToCartError(this.message);
}
class AddToCartSuccess extends CartStates{}


class UpdateCartLoading extends CartStates{}
class UpdateCartError extends CartStates{
  String message;
  UpdateCartError(this.message);
}
class UpdateCartSuccess extends CartStates{}





class DeleteFromCartLoading extends CartStates{}
class DeleteFromCartSuccess extends CartStates{}
class DeleteFromCartError extends CartStates{
  String message;
  DeleteFromCartError(this.message);
}




