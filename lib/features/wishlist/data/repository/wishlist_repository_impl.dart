import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/wishlist/data/data_source/remote/wishlist_remote_data_source.dart';
import 'package:ecommerce/features/wishlist/domain/entities/wishlist.dart';
import 'package:ecommerce/features/wishlist/domain/entities/wishlist_product_data.dart';
import 'package:ecommerce/features/wishlist/domain/repository/wishlist_repository.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: WishlistRepository)
class WishListRepositoryImpl implements WishlistRepository{
  final WishListRemoteDataSource _remoteDataSource;
  WishListRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, void>> addToWishlist(String productId) async{
    try{
      await _remoteDataSource.addToWishList(productId);
      return Right(null);
    } on RemoteException catch(exception)
    {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, List<WishlistProductDate>>> getWishlist() async{
    try{
     final response = await _remoteDataSource.getWishList();
    return Right(response.products);
    } on RemoteException catch(exception)
    {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, List<WishlistProductDate>>> deleteFromWishlist(String productId) async{
   try{
    final response = await _remoteDataSource.deleteFromWishlist(productId);
     return Right(response.products);
   }on RemoteException catch(exception)
    {
      return Left(Failure(exception.message));
    }
  }

}