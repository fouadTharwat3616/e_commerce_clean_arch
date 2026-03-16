import 'package:ecommerce/features/home/domain/entities/brand.dart';

class BrandsResponse {
  int? results;
  Metadata? metadata;
  List<BrandsModel>? data;

  BrandsResponse({this.results, this.metadata, this.data});

  BrandsResponse.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = <BrandsModel>[];
      json['data'].forEach((v) {
        data!.add(new BrandsModel.fromJson(v));
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

class BrandsModel extends Brand{
  String? slug;
  String? createdAt;
  String? updatedAt;

  BrandsModel(
      {
        required super.sId,
        required super.name,
        required super.image,
        this.slug,
        this.createdAt,
        this.updatedAt});

  BrandsModel.fromJson(Map<String, dynamic> json)
   : super (
    sId : json['_id'] ?? '',
    name : json['name'] ?? '',
    image : json['image'] ?? '',
  )
  { slug = json['slug'];
  createdAt = json['createdAt'];
  updatedAt = json['updatedAt'];
  }


}