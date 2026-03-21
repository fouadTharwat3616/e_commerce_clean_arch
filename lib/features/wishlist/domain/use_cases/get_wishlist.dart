import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/wishlist/domain/entities/wishlist_product_data.dart';
import 'package:ecommerce/features/wishlist/domain/repository/wishlist_repository.dart';
import 'package:injectable/injectable.dart';
@singleton
class GetWishlist{
  final WishlistRepository _wishlistRepository;
  GetWishlist(this._wishlistRepository);

  Future<Either<Failure,List<WishlistProductDate>>> call()=>
      _wishlistRepository.getWishlist();

}