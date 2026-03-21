import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/cart/data/data_source/remote/cart_remote_data_source.dart';
import 'package:ecommerce/features/cart/data/models/cart_response.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: CartRemoteDataSource)
class CartAPIRemoteDataSource implements CartRemoteDataSource{
  final Dio _dio;
  CartAPIRemoteDataSource(this._dio);

  @override
  Future<CartResponse> getCart() async{
    try{
     final response=await _dio.get(APIConstants.cartEndpoint);
     return CartResponse.fromJson(response.data);
    }catch(exception)
    {
      if(exception is DioException && exception.response?.statusCode==404)
        {
          throw const RemoteException('Cart is Empty');
        }
      throw const RemoteException('Failed to get Cart');
    }
  }


  @override
  Future<void> addToCart(String productID) async{
    try{
      await _dio.post(
          APIConstants.cartEndpoint,
        data: {
          "productId": productID
        }
      );
    } catch(_)
    {
      throw const RemoteException('Failed to add product to cart');

    }
  }

  @override
  Future<CartResponse> deleteFromCart(String productID) async{
    try{
     final response =await _dio.delete('${APIConstants.cartEndpoint}/$productID');
     return CartResponse.fromJson(response.data);
    }catch(_)
    {
      throw const RemoteException('Failed To Delete Product From Cart');
    }
  }

  @override
  Future<CartResponse> updateCart(String productID, int count) async{
  try {
    final response = await _dio.put(
      '${APIConstants.cartEndpoint}/$productID',
      data: {
        "count": count
      }
    );
    return CartResponse.fromJson(response.data);
  }catch (_)
    {
      throw const RemoteException('Failed to Update Product Count');
    }
  }

}