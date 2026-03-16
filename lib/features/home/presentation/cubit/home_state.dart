import 'package:ecommerce/features/home/domain/entities/brand.dart';
import 'package:ecommerce/features/home/domain/entities/craegory.dart';

abstract class HomeStates{}

class HomeInitialState extends HomeStates{}


class GetCategoriesLoading extends HomeStates{}

class GetCategoriesSuccess extends HomeStates{
  final List<Category> categories;
  GetCategoriesSuccess(this.categories);
}

class GetCategoriesError extends HomeStates{
  String message;
  GetCategoriesError(this.message);
}


class GetBrandsLoading extends HomeStates{}

class GetBrandsSuccess extends HomeStates{
  final List<Brand> Brands;
  GetBrandsSuccess(this.Brands);
}

class GetBrandsError extends HomeStates{
  String message;
  GetBrandsError(this.message);
}