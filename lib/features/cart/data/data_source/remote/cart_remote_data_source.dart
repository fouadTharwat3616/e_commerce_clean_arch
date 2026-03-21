import 'package:ecommerce/features/cart/data/models/cart_response.dart';

abstract class CartRemoteDataSource{
  Future<CartResponse> getCart();
  Future<void> addToCart(String productID);
  Future<CartResponse> deleteFromCart(String productID);
  Future<CartResponse> updateCart(String productID,int count);
}