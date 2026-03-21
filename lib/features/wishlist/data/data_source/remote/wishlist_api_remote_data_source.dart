import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/wishlist/data/data_source/remote/wishlist_remote_data_source.dart';
import 'package:ecommerce/features/wishlist/data/models/wishlist_response.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: WishListRemoteDataSource)
class WishlistAPIRemoteDataSource implements WishListRemoteDataSource{
  final Dio _dio;
  WishlistAPIRemoteDataSource(this._dio);
  @override
  Future<void> addToWishList(String productId) async{
    try{
    await _dio.post(
        APIConstants.wishlistEndpoint,
        data: {
          "productId": productId
        }
      );
    }catch (exception) {
      if(exception is DioException && exception.response?.statusCode==404)
      {
        throw const RemoteException('Cart is Empty');
      }
      throw const RemoteException('Failed to Add to WishList');
    }
  }

  @override
  Future<WishlistResponse> getWishList() async{
  try {
    final response = await _dio.get(APIConstants.wishlistEndpoint);
    return WishlistResponse.fromJson(response.data);
  }catch(exception)
    {
      if(exception is DioException && exception.response?.statusCode==404)
      {
        throw const RemoteException('Wishlist is Empty');
      }
      throw const RemoteException('Failed to get WishList');
    }
  }

  @override
  Future<WishlistResponse> deleteFromWishlist(String productId) async{
   try{
     final response = await _dio.delete('${APIConstants.wishlistEndpoint}/$productId');
     if (response.data is String) {
       return WishlistResponse.fromJson({
         "status": "success",
         "data": null,
         "count": 0
       });
     }
     return WishlistResponse.fromJson(response.data);
   }catch(e)
    {
      if (e.toString().contains('String') && e.toString().contains('subtype')) {
        return WishlistResponse(status: 'success');
      }
      print(e);
      throw const RemoteException('Failed To Delete Product From Wishlist');
    }
  }

}