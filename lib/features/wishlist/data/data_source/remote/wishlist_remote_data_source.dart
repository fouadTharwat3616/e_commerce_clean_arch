import 'package:ecommerce/features/wishlist/data/models/wishlist_response.dart';

abstract class WishListRemoteDataSource{
  Future<void> addToWishList(String productID);
  Future<WishlistResponse> getWishList();

  Future<WishlistResponse> deleteFromWishlist(String productId);
}