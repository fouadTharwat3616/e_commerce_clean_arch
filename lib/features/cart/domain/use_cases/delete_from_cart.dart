import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';
@singleton
class DeleteFromCart{
  final CartRepository _cartRepository;
  DeleteFromCart(this._cartRepository);

  Future<Either<Failure,Cart>> call(String productId)=>
      _cartRepository.deleteCart(productId);

}