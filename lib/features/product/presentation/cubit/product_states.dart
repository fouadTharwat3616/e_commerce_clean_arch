import 'package:ecommerce/features/product/domain/entities/product.dart';

abstract class ProductStates {}


class GetProductInitial extends ProductStates{}

class GetProductLoading extends ProductStates{}
class GetProductSuccess extends ProductStates{
  final List<Product> products;
  GetProductSuccess(this.products);
}
class GetProductError extends ProductStates{
  final String message;
  GetProductError(this.message);
}