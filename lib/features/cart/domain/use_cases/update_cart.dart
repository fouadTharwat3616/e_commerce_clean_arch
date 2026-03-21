import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';
@singleton
class UpdateCart{
  final CartRepository _cartRepository;
  UpdateCart(this._cartRepository);

  Future<Either<Failure,Cart>> call(String productID,int count)=>
      _cartRepository.updateCart(productID, count);
}