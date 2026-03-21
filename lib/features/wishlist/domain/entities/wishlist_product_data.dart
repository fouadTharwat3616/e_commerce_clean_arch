class WishlistProductDate {
  final String id;
  final String title;
  final String imageCover;
  final String categoryName;
  final String brandName;
  final num price;
  final num? priceAfterDiscount;
  final num ratingsAverage;
  final String description;

  WishlistProductDate({
    required this.id,
    required this.title,
    required this.imageCover,
    required this.categoryName,
    required this.brandName,
    required this.price,
    this.priceAfterDiscount,
    required this.ratingsAverage,
    required this.description,
  });
}
