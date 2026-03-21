import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AuthLocalDataSource)
class AuthSharedPrefLocalDataSource implements AuthLocalDataSource {
  final SharedPreferences _preference;
  AuthSharedPrefLocalDataSource(this._preference);
  @override
  Future<void> saveToken(String token) async {
    try {
      await _preference.setString(CacheConstants.tokenKey, token);
    } catch (_) {
      throw const LocalException('Failed to save token');
    }
  }
  @override
  String getToken()  {
    try {
      return _preference.getString(CacheConstants.tokenKey)!;
    } catch (_) {
      throw const LocalException('Failed to get token');
    }
  }

  @override
  Future<void> saveName(String name) {
    try{
     return _preference.setString(CacheConstants.name, name);
    }catch(_)
    {
      throw const LocalException('Failed to save name');
    }
  }

  @override
  String getName() {
    try{
     return _preference.getString(CacheConstants.name)!;
    }catch(_)
    {
      throw const LocalException('Failed to get name');
    }
  }

  @override
  Future<void> saveEmail(String email) {
    try{
      return _preference.setString(CacheConstants.email, email);
    }catch(_)
    {
      throw const LocalException('Failed to save Email');
    }
  }
  @override
  String getEmail() {
    try{
      return _preference.getString(CacheConstants.email)!;
    }catch(_)
    {
      throw const LocalException('Failed to get Email');
    }
  }



  @override
  Future<void> savePassword(String password) async{
   try{
     await _preference.setString(CacheConstants.password,password);
   }catch(_)
    {
      throw const LocalException('Failed to Save Password');
    }
  }
  @override
  String getPassword() {
    try{
      return _preference.getString(CacheConstants.password)!;
    }catch(_)
    {
      throw const LocalException('Failed to get Password');
    }
  }


  @override
  Future<void> savePhone(String phone) async{
    try{
      await _preference.setString(CacheConstants.phone,phone);
    }catch(_)
    {
      throw const LocalException('Failed to Save Phone');
    }
  }
  @override
  String getPhone() {
    try{
      return _preference.getString(CacheConstants.phone)!;
    }catch(_)
    {
      throw const LocalException('Failed to get Phone');
    }
  }










}
