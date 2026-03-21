import 'package:ecommerce/features/wishlist/domain/entities/wishlist_product_data.dart';

class WishlistEntity {
  final int count;
  final List<WishlistProductDate> products;

  WishlistEntity({required this.count, required this.products});
}
