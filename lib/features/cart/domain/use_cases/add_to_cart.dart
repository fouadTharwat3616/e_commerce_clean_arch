import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';
@singleton
class AddToCard{
  final CartRepository _cartRepository;
  AddToCard(this._cartRepository);

  Future<Either<Failure,void>> call(String productId) =>
      _cartRepository.addToCard(productId);
}