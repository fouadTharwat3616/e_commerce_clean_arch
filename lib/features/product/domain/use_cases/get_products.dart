import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/product/domain/entities/product.dart';
import 'package:ecommerce/features/product/domain/repository/product_repository.dart';
import 'package:injectable/injectable.dart';
@singleton
class GetProducts{
  final ProductRepository _repository;
  GetProducts(this._repository);

  Future<Either<Failure,List<Product>>> call() =>
      _repository.getProducts();
}