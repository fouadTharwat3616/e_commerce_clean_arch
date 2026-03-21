import 'package:ecommerce/features/wishlist/domain/entities/wishlist.dart';
import 'package:ecommerce/features/wishlist/domain/entities/wishlist_product_data.dart';

class WishlistResponse extends WishlistEntity {
  String? status;

  WishlistResponse({
    this.status,
    int? count,
    List<WishlistProductModel>? data,
  }) : super(
    count: count ?? 0,
    products: data ?? [],
  );

  factory WishlistResponse.fromJson(Map<String, dynamic> json) {
    return WishlistResponse(
      status: json['status'],
      count: json['count'],
      data: json['data'] != null
          ? (json['data'] as List)
          .map((v) => WishlistProductModel.fromJson(v))
          .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['count'] = count;
    if (products != null) {
      data['data'] = products.map((v) => (v as WishlistProductModel).toJson()).toList();
    }
    return data;
  }
}

class WishlistProductModel extends WishlistProductDate {
  num? sold;
  List<String>? images;
  int? ratingsQuantity;
  String? sId;
  String? slug;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Category? category;
  Category? brand;

  WishlistProductModel({
    this.sold,
    this.images,
    this.ratingsQuantity,
    this.sId,
    this.slug,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.category,
    this.brand,
    required String id,
    required String title,
    required String imageCover,
    required num price,
    num? priceAfterDiscount,
    required num ratingsAverage,
    required String description,
  }) : super(
    id: id,
    title: title,
    imageCover: imageCover,
    categoryName: category?.name ?? "",
    brandName: brand?.name ?? "",
    price: price,
    priceAfterDiscount: priceAfterDiscount,
    ratingsAverage: ratingsAverage,
    description: description,
  );

  factory WishlistProductModel.fromJson(Map<String, dynamic> json) {
    final categoryObj = json['category'] != null ? Category.fromJson(json['category']) : null;
    final brandObj = json['brand'] != null ? Category.fromJson(json['brand']) : null;

    return WishlistProductModel(
      sold: json['sold'] as num?, // تم التغيير لـ num
      images: json['images'] != null ? List<String>.from(json['images']) : [],
      ratingsQuantity: json['ratingsQuantity'],
      sId: json['_id'],
      slug: json['slug'],
      quantity: json['quantity'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['__v'],
      category: categoryObj,
      brand: brandObj,
      id: json['id'] ?? json['_id'] ?? "",
      title: json['title'] ?? "",
      imageCover: json['imageCover'] ?? "",
      price: json['price'] ?? 0,
      priceAfterDiscount: json['priceAfterDiscount'],
      ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble() ?? 0.0, // ضمان التحويل لـ double
      description: json['description'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sold'] = sold;
    data['images'] = images;
    data['ratingsQuantity'] = ratingsQuantity;
    data['_id'] = sId;
    data['title'] = title;
    data['slug'] = slug;
    data['description'] = description;
    data['quantity'] = quantity;
    data['price'] = price;
    data['imageCover'] = imageCover;
    if (category != null) data['category'] = category!.toJson();
    if (brand != null) data['brand'] = brand!.toJson();
    data['ratingsAverage'] = ratingsAverage;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['id'] = id;
    data['priceAfterDiscount'] = priceAfterDiscount;
    return data;
  }
}

class Category {
  String? sId;
  String? name;
  String? slug;
  String? image;

  Category({this.sId, this.name, this.slug, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    return data;
  }
}
