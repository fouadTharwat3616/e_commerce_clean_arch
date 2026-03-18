import 'package:ecommerce/features/product/domain/entities/product.dart';
import 'package:flutter/cupertino.dart';

class ProductResponse {
  int? results;
  Metadata? metadata;
  List<ProductModel>? data;

  ProductResponse({this.results, this.metadata, this.data});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? Metadata.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = <ProductModel>[];
      json['data'].forEach((v) {
        data!.add(ProductModel.fromJson(v));
      });
    }
  }


}

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;

  Metadata({this.currentPage, this.numberOfPages, this.limit, this.nextPage});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }

}

class ProductModel extends Product{
  String? slug;
  int? quantity;
  CategoryModel? category;
  CategoryModel? brand;
  String? createdAt;
  String? updatedAt;
  int? priceAfterDiscount;


  ProductModel({ required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.imageCover,
    required super.images,
    required super.ratingsAverage,
    required super.ratingsQuantity,
    required super.sold,
    this.slug,
    this.quantity,
    this.category,
    this.brand,
    this.createdAt,
    this.updatedAt,
    this.priceAfterDiscount,
  }
      );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? json['_id'],
      title: json['title'],
      description: json['description'],
      price: json['price']?.toInt(),
      imageCover: json['imageCover'],
      images: json['images'] != null ? List<String>.from(json['images']) : [],
      ratingsAverage: json['ratingsAverage']?.toDouble(),
      ratingsQuantity: json['ratingsQuantity']?.toInt(),
      sold: json['sold']?.toInt(),
      slug: json['slug'],
      quantity: json['quantity'],
      priceAfterDiscount: json['priceAfterDiscount'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      category: json['category'] != null ? CategoryModel.fromJson(json['category']) : null,
      brand: json['brand'] != null ? CategoryModel.fromJson(json['brand']) : null,
    );
  }
}

class BrandModel {
  String? sId;
  String? name;
  String? slug;
  String? category;

  BrandModel({this.sId, this.name, this.slug, this.category});

  BrandModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}

class CategoryModel {
  String? sId;
  String? name;
  String? slug;
  String? image;

  CategoryModel({this.sId, this.name, this.slug, this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['image'] = this.image;
    return data;
  }
}