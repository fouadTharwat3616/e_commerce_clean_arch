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
  User? user;


  Future<void> loadUser()async{
    emit(ProfileLoading());
    if (user != null) {
      emit(ProfileSuccess(user!));
      return;
    }

    final _pref = await SharedPreferences.getInstance();
    user=User(
        name: _pref.getString(CacheConstants.name)!,
        email: _pref.getString(CacheConstants.email)!,
        phone: _pref.getString(CacheConstants.phone)?? "No Phone",
        password: _pref.getString(CacheConstants.password)??'No password'
    );
    if (!isClosed) {
      emit(ProfileSuccess(user!));
    }
  }
}