import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/profile/presentation/cubit/profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
@singleton
class ProfileCubit extends Cubit<ProfileStates>
{
  ProfileCubit():super(ProfileInitial());
  late final User user;



  Future<void> loadUser()async{
    emit(ProfileLoading());

    final _pref = await SharedPreferences.getInstance();
    user=User(
        name: _pref.getString(CacheConstants.name)!,
        email: _pref.getString(CacheConstants.email)!
    );

    emit(ProfileSuccess(user));
  }
}