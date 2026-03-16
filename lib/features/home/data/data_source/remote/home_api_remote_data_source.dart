import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:ecommerce/features/home/data/models/brands_response/brands_response.dart';
import 'package:ecommerce/features/home/data/models/categories_response/categories_response.dart';
import 'package:injectable/injectable.dart';
@Singleton(as:HomeRemoteDataSource)
class HomeAPIRemoteDataSource implements HomeRemoteDataSource{
  final Dio _dio;
  HomeAPIRemoteDataSource(this._dio);

  @override
  Future<CategoriesResponse> getCategories() async{

    try{
      final response =await _dio.get(APIConstants.categoriesEndpoint);
      return CategoriesResponse.fromJson(response.data);
    }catch(_)
    {
      throw const RemoteException('Failed to get categories');
    }
  }

  @override
  Future<BrandsResponse> getBrands() async{
   try {
     final response = await _dio.get(APIConstants.brandsEndpoint);
     return BrandsResponse.fromJson(response.data);
   }catch(_)
   {
      throw const RemoteException('Failed to get brands');
    }
  }


  
}