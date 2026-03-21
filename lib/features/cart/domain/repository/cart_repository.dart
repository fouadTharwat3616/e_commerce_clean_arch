import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';

abstract class CartRepository{
  Future<Either<Failure,Cart>> getCards();
  Future<Either<Failure,void>> addToCard(String productId);
  Future<Either<Failure,Cart>> updateCart(String productID,int count);
  Future<Either<Failure,Cart>> deleteCart(String productId);
}