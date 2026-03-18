import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/product/data/data_source/remote/product_remote_data_source.dart';
import 'package:ecommerce/features/product/domain/entities/product.dart';
import 'package:ecommerce/features/product/domain/repository/product_repository.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository{
  final ProductRemoteDataSource _remoteDataSource;
  ProductRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, List<Product>>> getProducts() async{
    try{
     final response = await _remoteDataSource.getProducts();
     return Right(response.data!);
    }on RemoteException catch(exception)
    {
     return Left(Failure(exception.message));
    }
  }

}