import 'package:ecommerce/features/product/data/models/products_response.dart';

abstract class ProductRemoteDataSource {
  Future<ProductResponse>  getProducts();
}