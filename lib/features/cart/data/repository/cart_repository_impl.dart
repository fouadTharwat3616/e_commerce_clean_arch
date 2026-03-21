import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/data/data_source/remote/cart_remote_data_source.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: CartRepository)
class CartRepositoryImpl extends CartRepository{
  final CartRemoteDataSource _remoteDataSource;
  CartRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, void>> addToCard(String productId) async{
    try {
      await _remoteDataSource.addToCart(productId);
      return const Right(null);
    }on RemoteException catch(exception)
    {
      return Left(Failure(exception.message));
    }

  }

  @override
  Future<Either<Failure, Cart>> getCards() async{
    try{
     final response = await _remoteDataSource.getCart();
     return Right(response.data);
    }on RemoteException catch(exception){
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, Cart>> updateCart(String productID, int count) async{
    try {
      final response = await _remoteDataSource.updateCart(productID, count);
      return Right(response.data);
    } on RemoteException catch(exception)
    {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, Cart>> deleteCart(String productId) async{
    try{
    final response =await  _remoteDataSource.deleteFromCart(productId);
    return Right(response.data);
    }on RemoteException catch(exception)
    {
      return Left(Failure(exception.message));
    }
  }


}