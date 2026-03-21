import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/login_response.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/models/register_response.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthAPIRemoteDataSource implements AuthRemoteDataSource {
  final Dio _dio ;
  AuthAPIRemoteDataSource(this._dio);

  @override
  Future<RegisterResponse> register(RegisterRequest requestBody) async {
    try {
      final response = await _dio.post(
        APIConstants.registerEndpoint,
        data: requestBody.toJson(),
      );
      return RegisterResponse.fromJson(response.data);
    } catch (exception) {
      var message = 'Failed to register';
      if (exception is DioException) {
        final errorMessage = exception.response?.data['message'];
        if (errorMessage != null) message = errorMessage;
      }
      throw RemoteException(message);
    }
  }

  @override
  Future<LoginResponse> login(LoginRequest requestBody) async {
    try {
      final response = await _dio.post(
        APIConstants.loginEndpoint,
        data: requestBody.toJson(),
      );
      return LoginResponse.fromJson(response.data);
    } catch (exception) {
      var message = 'Failed to login';
      if (exception is DioException) {
        final errorMessage = exception.response?.data['message'];
        if (errorMessage != null) message = errorMessage;
      }
      throw RemoteException(message);
    }
  }
}
