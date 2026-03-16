import 'package:ecommerce/features/home/domain/entities/craegory.dart';

class CategoriesResponse {
  int? results;
  Metadata? metadata;
  List<CategoryModel>? data;

  CategoriesResponse({this.results, this.metadata, this.data});

  CategoriesResponse.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = <CategoryModel>[];
      json['data'].forEach((v) {
        data!.add(new CategoryModel.fromJson(v));
      });
    }
  }

}

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }


}

class CategoryModel extends Category{
  String? slug;
  String? createdAt;
  String? updatedAt;

  CategoryModel(
      {
       required super.sId,
       required super.name,
       required super.image,
        this.slug,
        this.createdAt,
        this.updatedAt
      });

  CategoryModel.fromJson(Map<String, dynamic> json)
      : super(
  sId: json['_id'] ?? '',
  name: json['name'] ?? '',
  image: json['image'] ?? '',
  )
  {
  slug = json['slug'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

}