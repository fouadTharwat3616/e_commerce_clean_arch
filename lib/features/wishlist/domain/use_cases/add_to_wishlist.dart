import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/wishlist/domain/repository/wishlist_repository.dart';
import 'package:injectable/injectable.dart';
@singleton
class AddToWishlist{
  final WishlistRepository _wishlistRepository;
  AddToWishlist(this._wishlistRepository);

  Future<Either<Failure,void>> call(String productId)=>
      _wishlistRepository.addToWishlist(productId);
}