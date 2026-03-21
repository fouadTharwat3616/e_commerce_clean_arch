import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/wishlist/domain/entities/wishlist.dart';
import 'package:ecommerce/features/wishlist/domain/entities/wishlist_product_data.dart';

abstract class WishlistRepository{
  Future<Either<Failure,void>> addToWishlist(String productId);

  Future<Either<Failure,List<WishlistProductDate>>> getWishlist();

  Future<Either<Failure,List<WishlistProductDate>>> deleteFromWishlist(String productId);
}