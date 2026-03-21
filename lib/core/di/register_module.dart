import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio {
   final dio = Dio(
      BaseOptions(
        baseUrl: APIConstants.baseURL,
        receiveDataWhenStatusError: true,
      )
   );
      dio.interceptors.add(
         InterceptorsWrapper(
           onRequest: (options,handler) async{
             final sharedPref =await SharedPreferences.getInstance();
             final token= sharedPref.get(CacheConstants.tokenKey);
             if(token!=null) options.headers[APIConstants.token]=token;
             return handler.next(options);
           },
         ),
       );
   return dio;
  }
  @preResolve
  Future<SharedPreferences> get sharedPref => SharedPreferences.getInstance();
  }




