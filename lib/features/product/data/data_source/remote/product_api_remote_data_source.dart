import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/product/data/data_source/remote/product_remote_data_source.dart';
import 'package:ecommerce/features/product/data/models/products_response.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: ProductRemoteDataSource)
class ProductAPIREmoteDataSource implements ProductRemoteDataSource{
  final Dio _dio;
  ProductAPIREmoteDataSource(this._dio);
  @override
  Future<ProductResponse> getProducts() async{
    try{
     final response =await _dio.get(APIConstants.productEndpoint);
     return ProductResponse.fromJson(response.data);
    }catch(_){

      throw const RemoteException('Failed to get products');
    }
  }
}