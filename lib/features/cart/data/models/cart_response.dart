import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_item.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_product.dart';

class CartResponse {
  final String? status;
  final int? numOfCartItems;
  final CartModel data;

  const CartResponse({
    this.status,
    this.numOfCartItems,
    required this.data,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      status: json['status'] as String?,
      numOfCartItems: json['numOfCartItems'] as int?,
      data: CartModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class CartModel extends Cart{
  final String? id;
  final String? cartOwner;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const CartModel({
    required super.products,
    required super.totalPrice,
    this.id,
    this.cartOwner,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    id: json['_id'] as String?,
    cartOwner: json['cartOwner'] as String?,
    products: (json['products'] as List<dynamic>)
        .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    v: json['__v'] as int?,
    totalPrice: json['totalCartPrice'] as int,
  );
}

class CartItemModel extends CartItemData{
  const CartItemModel({
    required super.id,
    required super.count,
    required super.price,
    required super.product,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
    count: json['count'] as int,
    id: json['_id'] as String,
    product:
    CartProductModel.fromJson(json['product'] as Map<String, dynamic>),
    price: json['price'] as int,
  );
}

class CartProductModel extends CartProduct{
  const CartProductModel({
    required super.id,
    required super.title,
    required super.coverImageURL,
    required super.ratingsAverage,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['_id'] as String,
      title: json['title'] as String,
      coverImageURL: json['imageCover'] as String,
      ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
    );
  }
}
